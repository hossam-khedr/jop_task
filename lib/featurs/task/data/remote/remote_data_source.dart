import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jop_task/core/app_constants.dart';
import 'package:jop_task/core/networking/api_services/api_services.dart';
import 'package:jop_task/core/secure_manager.dart';
import 'package:jop_task/featurs/task/data/data_source.dart';

import '../../../../core/params/create_task_params.dart';

class TaskDataSourceImpl implements TaskDatasource {
  final ApiServices apiServices;

  TaskDataSourceImpl({required this.apiServices});

  @override
  Future<dynamic> addTask(CreateTaskParams params) async {
    var data = {
      'image': params.image,
      'title': params.title,
      'desc': params.desc,
      'priority': params.priority,
      'dueDate': params.dueDate
    };

    final response = await apiServices.postRequest(
      endpoint: 'todos',
      data: data,
    );
    return response;
  }

  @override
  Future<dynamic> logout() async {
    var accessToken =
        await SecureManager.getData(key: AppConstants.accessToken);
    final response = await apiServices.postRequest(
      endpoint: 'auth/logout',
      data: {'token': accessToken},
    );
    return response;
  }

  @override
  Future<dynamic> getUserInfo() async {
    final response = await apiServices.getRequest(
      endpoint: 'auth/profile',
    );
    return response;
  }

  @override
  Future<dynamic> getTasks(int pageNumber) async {
    final response = await apiServices
        .getRequest(endpoint: 'todos', queryParameters: {'page': pageNumber});
    return response;
  }

  @override
  Future<dynamic> uploadImage(File imagePath) async {
    FormData data = FormData.fromMap(
      {
        'image': await MultipartFile.fromFile(
          imagePath.path,
          filename:imagePath.path.split('/').last,
        ),
      },
    );
    final response = await apiServices.postRequest(
      endpoint: 'upload/image',
      data: data,
      options: Options(
        headers: { 'Content-Type': 'multipart/form-data',}
      )
    );
    return response;
  }
  
  @override
  Future<dynamic> getTaskInfo(String id)async {
    final response = await apiServices.getRequest(endpoint: 'todos/$id');
    return response;
  }
}
