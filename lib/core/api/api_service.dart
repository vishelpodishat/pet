import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/constants/constants.dart';
import 'package:mvvm/core/api/api_exception.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  late final Dio _dio;

  factory ApiService() {
    return _instance;
  }

  ApiService._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseURL,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        responseType: ResponseType.json,
      ),
    );
    configureInterceptors();
  }

  void configureInterceptors() {
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: kDebugMode,
        responseBody: kDebugMode,
        logPrint: (object) {
          if (kDebugMode) print(object);
        },
      ),
    );
  }

  Future<T> get<T>({required String endpoint, Options? options, T Function(dynamic data)? parser}) async {
    try {
      final Response response = await _dio.get(endpoint, options: options);

      if (parser != null) {
        return parser(response.data);
      } else {
        return response.data as T;
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(DioException error) {
    String errorMessage = 'Something went wrong. Please try again later.';

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Connection timed out. Please check your internet connection.';
        break;
      case DioExceptionType.badCertificate:
        errorMessage = 'Invalid certificate. Please contact support.';
        break;
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final responseData = error.response?.data;

        if (responseData != null && responseData is Map && responseData.containsKey('message')) {
          errorMessage = responseData['message'] as String;
        } else {
          switch (statusCode) {
            case 400:
              errorMessage = 'Bad request. Please check your input.';
              break;
            case 401:
              errorMessage = 'Unauthorized. Please login again.';
              break;
            case 403:
              errorMessage = 'Forbidden. You don\'t have permission to access this resource.';
              break;
            case 404:
              errorMessage = 'Resource not found.';
              break;
            case 500:
            case 501:
            case 502:
            case 503:
              errorMessage = 'Server error. Please try again later.';
              break;
          }
        }
        break;
      case DioExceptionType.cancel:
        errorMessage = 'Request was cancelled.';
        break;
      case DioExceptionType.connectionError:
        errorMessage = 'Connection error. Please check your internet connection.';
        break;
      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          errorMessage = 'No internet connection. Please check your network.';
        }
        break;
    }

    return ApiException(errorMessage, error);
  }
}
