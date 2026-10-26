import 'package:dio/dio.dart';
import 'package:luxora_app/core/network/api_error.dart';

class ApiException {
  static ApiError handleError(DioException error) {
    final data = error.response?.data;
    final statusCode = error.response?.statusCode;
    print(statusCode);
    print(data);
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiError(message: "Connection timeout. Please try again.");

      case DioExceptionType.sendTimeout:
        return ApiError(message: 'Sending data took too long.');

      case DioExceptionType.receiveTimeout:
        return ApiError(message: 'Receiving data took too long.');

      case DioExceptionType.connectionError:
        return ApiError(message: 'No internet connection.');

      case DioExceptionType.badResponse:
        return _handleStatusCode(error);

      case DioExceptionType.cancel:
        return ApiError(message: 'Request was cancelled.');

      case DioExceptionType.badCertificate:
        return ApiError(message: 'Secure connection failed.');

      case DioExceptionType.transformTimeout:
        return ApiError(message: 'Processing the response took too long.');

      case DioExceptionType.unknown:
        return ApiError(message: 'Something went wrong. Please try again.');
    }
  }

  static ApiError _handleStatusCode(DioException error) {
    final statusCode = error.response?.statusCode;

    switch (statusCode) {
      case 400:
        return ApiError(
          message: 'Invalid email or password.',
          statusCode: statusCode,
        );

      case 401:
        return ApiError(
          message: 'Unauthorized. Please login again.',
          statusCode: statusCode,
        );

      case 403:
        return ApiError(
          message: 'You do not have permission.',
          statusCode: statusCode,
        );

      case 404:
        return ApiError(
          message: 'The requested resource was not found.',
          statusCode: statusCode,
        );

      case 408:
        return ApiError(message: 'Request timed out.', statusCode: statusCode);

      case 422:
        return ApiError(
          message: 'Please check the submitted data.',
          statusCode: statusCode,
        );

      case 429:
        return ApiError(
          message: 'Too many requests. Please wait and try again.',
          statusCode: statusCode,
        );

      case 500:
      case 501:
      case 502:
      case 503:
      case 504:
        return ApiError(
          message: 'Server error. Please try again later.',
          statusCode: statusCode,
        );

      default:
        return ApiError(
          message: 'Something went wrong. Please try again.',
          statusCode: statusCode,
        );
    }
  }
}
