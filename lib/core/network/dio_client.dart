import 'package:dio/dio.dart';
import 'package:luxora_app/core/utils/pref_helper.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://accessories-eshop.runasp.net',
      headers: {'Accept': 'application/json'},
    ),
  );

  final Dio _refreshDio = Dio(
    BaseOptions(
      baseUrl: 'https://accessories-eshop.runasp.net',
      headers: {'Accept': 'application/json'},
    ),
  );

  DioClient() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          try {
            final isAuthEndpoint =
                options.path.endsWith('/api/auth/login') ||
                options.path.endsWith('/api/auth/refresh-token');

            if (!isAuthEndpoint) {
              await _ensureValidToken();
            }

            final token = await PrefHelper.getAccessToken();

            if (!isAuthEndpoint && token != null && token.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $token';
            }

            print('========== API REQUEST ==========');
            print('URL: ${options.uri}');
            print('METHOD: ${options.method}');
            print('HAS ACCESS TOKEN: ${token != null && token.isNotEmpty}');

            handler.next(options);
          } catch (e) {
            handler.reject(
              DioException(
                requestOptions: options,
                error: e,
                type: DioExceptionType.unknown,
              ),
            );
          }
        },

        onError: (error, handler) async {
          print('========== API ERROR ==========');
          print('URL: ${error.requestOptions.uri}');
          print('STATUS: ${error.response?.statusCode}');
          print('ERROR BODY: ${error.response?.data}');

          if (error.response?.statusCode == 401) {
            await _refreshAndRetry(error, handler);
          } else {
            handler.next(error);
          }
        },
      ),
    );
  }

  // 1. Check whether the access token is about to expire.
  Future<void> _ensureValidToken() async {
    final expiresAtString = await PrefHelper.getExpiresAt();

    if (expiresAtString == null) return;

    final expiresAt = DateTime.tryParse(expiresAtString);

    if (expiresAt == null) return;

    final refreshBefore = expiresAt.subtract(const Duration(seconds: 30));

    if (!DateTime.now().toUtc().isBefore(refreshBefore.toUtc())) {
      await _refreshToken();
    }
  }

  // 2. Get new tokens using the saved refresh token.
  Future<String> _refreshToken() async {
    final refreshToken = await PrefHelper.getRefreshToken();

    if (refreshToken == null || refreshToken.isEmpty) {
      await PrefHelper.clearTokens();
      throw Exception('No refresh token. Please login again.');
    }

    try {
      final response = await _refreshDio.post(
        '/api/auth/refresh-token',
        data: {'refreshToken': refreshToken, 'useCookies': false},
        options: Options(contentType: Headers.jsonContentType),
      );

      final data = response.data as Map<String, dynamic>;

      final newAccessToken = data['accessToken'] as String;
      final newRefreshToken = data['refreshToken'] as String;
      final expiresAt = data['expiresAtUtc'] as String;

      await PrefHelper.saveTokens(
        accessToken: newAccessToken,
        refreshToken: newRefreshToken,
        expiresAt: expiresAt,
      );

      print('REFRESH SUCCESS');

      return newAccessToken;
    } catch (e) {
      await PrefHelper.clearTokens();
      rethrow;
    }
  }

  // 3. Retry the original request once after a 401 response.
  Future<void> _refreshAndRetry(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    final originalRequest = error.requestOptions;

    if (originalRequest.extra['retried'] == true) {
      handler.next(error);
      return;
    }

    try {
      final newAccessToken = await _refreshToken();

      originalRequest.extra['retried'] = true;
      originalRequest.headers['Authorization'] = 'Bearer $newAccessToken';

      final retryResponse = await _dio.fetch(originalRequest);

      handler.resolve(retryResponse);
    } on DioException catch (refreshError) {
      handler.next(refreshError);
    } catch (_) {
      handler.next(error);
    }
  }

  Dio get dio => _dio;
}
