import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:jop_task/core/networking/api_services/api_services.dart';

import '../error_handler.dart';

class AipServicesImplWithDio implements ApiServices {
  Dio dio;
  AipServicesImplWithDio({required this.dio}) {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://task.iraqsapp.com/',
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          responseType: ResponseType.json,
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          }),
    );
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // added your token
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioException error, handler) {
      final errorMessage = DioErrorHandler.handleDioError(error);
      debugPrint('ERROR : $errorMessage');
      return handler.next(error);
    }));
    if (true) {
      dio.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true),
      );
    }
  }

  @override
  Future<dynamic> deleteRequest(
      {required String endpoint,
      data,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    try {
      final response = await dio.delete(
        endpoint,
        data: data,
        options: options,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (error) {
      throw DioErrorHandler.handleDioError(error);
    }
  }

  @override
  Future getRequest(
      {required String endpoint,
      data,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    try {
      final response = await dio.get(
        endpoint,
        queryParameters: queryParameters,
        data: data,
        options: options,
      );
      return response;
    } on DioException catch (error) {
      throw DioErrorHandler.handleDioError(error);
    }
  }

  @override
  Future postRequest(
      {required String endpoint,
      required data,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    try {
      final response = await dio.post(
        endpoint,
        data: data,
        options: options,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (error) {
      throw DioErrorHandler.handleDioError(error);
    }
  }

  @override
  Future putRequest(
      {required String endpoint,
      required data,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    try {
      final response = await dio.put(
        endpoint,
        data: data,
        options: options,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (error) {
      throw DioErrorHandler.handleDioError(error);
    }
  }
}
