import 'package:dio/dio.dart';
import 'package:luxora_app/core/network/api_error.dart';
import 'package:luxora_app/core/network/api_exception.dart';
import 'package:luxora_app/core/network/api_service.dart';
import 'package:luxora_app/core/utils/pref_helper.dart';
import 'package:luxora_app/features/Auth/data/user_model.dart';

class AuthRepo {
  ApiService apiService = ApiService();

  //login

  Future<UserModel?> login(String email, String password) async {
    try {
      final response = await apiService.post("/api/auth/login", {
        "email": email,
        "password": password,
      });
      final user = UserModel.fromjson(response);
      if (user.accessToken != null &&
          user.accessToken!.isNotEmpty &&
          user.refreshToken != null &&
          user.refreshToken!.isNotEmpty) {
        await PrefHelper.saveTokens(
          accessToken: user.accessToken!,
          refreshToken: user.refreshToken!,
          expiresAt: user.expiresAtUtc!,
        );
        print('Access saved: ${await PrefHelper.getAccessToken() != null}');
        print('Refresh saved: ${await PrefHelper.getRefreshToken() != null}');
      }
      return user;
    } on DioException catch (e) {
      throw ApiException.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  //register
  Future<String> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiService.post("/api/auth/register", {
        "email": email,
        "password": password,
        "firstName": firstName,
        "lastName": lastName,
      });
      return response['message'] as String;
    } on DioException catch (e) {
      throw ApiException.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  //verify Email

  Future<String> verifyEmail({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await apiService.post("/api/auth/verify-email", {
        "email": email,
        "otp": otp,
      });
      return response as String;
    } on DioException catch (e) {
      throw ApiException.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  // refresh token
  Future<UserModel> refreshToken(String refreshToken) async {
    final response = await apiService.post('/api/auth/refresh-token', {
      'refreshToken': refreshToken,
      'useCookies': false,
    });
    return UserModel.fromjson(response);
  }
}
