import 'package:dio/dio.dart';

import 'api_error.dart';

class ApiException {
  static ApiError handelError(DioError error) {
    if (error.response != null) {
      final statusCode = error.response!.statusCode;
      final data = error.response!.data;
      if (statusCode == 404) {
        return ApiError(
          message: data is Map && data['message'] != null
              ? data['message']
              : 'Resource not found',
        );
      }

      if (statusCode == 302) {
        return ApiError(message: 'Server redirect error');
      }

      if (statusCode == 422 && data is Map<String, dynamic>) {
        final errors = data['errors'];

        if (errors is Map<String, dynamic>) {
          if (errors.containsKey('email')) {
            return ApiError(message: "This email is already registered");
          }

          if (errors.containsKey('name')) {
            return ApiError(message: "Please enter a valid name");
          }

          if (errors.containsKey('password')) {
            return ApiError(
              message: "Password must be at least 8 characters",
            );
          }
        }

        return ApiError(
          message: data['message']?.toString() ?? "Invalid input data",
        );
      }


      if (error.response != null) {
        final statusCode = error.response!.statusCode;
        final data = error.response!.data;

        if (data is Map && data['message'] != null) {
          return ApiError(message: data['message'].toString());
        }



        return ApiError(message: "Server error ($statusCode)");
      }

      if (statusCode == 302) {
        return ApiError(message: "Server redirect error");
      }

      return ApiError(message: "Server error ($statusCode)");
    }

    switch (error.type) {
      case DioErrorType.connectionTimeout:
        return ApiError(message: "Connection timeout");
      case DioErrorType.sendTimeout:
        return ApiError(message: "Send timeout");
      case DioErrorType.receiveTimeout:
        return ApiError(message: "Receive timeout");
      case DioErrorType.cancel:
        return ApiError(message: "Request cancelled");
      default:
        return ApiError(message: "No internet connection");
    }
  }
}
