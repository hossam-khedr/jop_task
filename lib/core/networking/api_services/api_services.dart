import 'package:dio/dio.dart';

abstract class ApiServices{
  Future<dynamic>getRequest({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options
});
  Future<dynamic>postRequest({
    required String endpoint,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options
});
  Future<dynamic>putRequest({
    required String endpoint,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options
});
  Future<dynamic>deleteRequest({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options
});
}