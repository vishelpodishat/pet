import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final DioException error;

  ApiException(this.message, this.error);

  @override
  String toString() => message;
}
