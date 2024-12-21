import 'package:dio/dio.dart';
import 'package:jop_task/core/app_constants.dart';
import 'package:jop_task/core/networking/api_services/api_services.dart';
import 'package:jop_task/core/secure_manager.dart';
import 'package:jop_task/featurs/task/data/data_source.dart';
import 'package:jop_task/featurs/task/data/models/task_model.dart';

class TaskDataSourceImpl implements TaskDatasource {
  final ApiServices apiServices;

  TaskDataSourceImpl({required this.apiServices});

  @override
  Future<dynamic> addTask(String path, TaskModel task) async {
    FormData fromData = FormData.fromMap({
      'image':
          await MultipartFile.fromFile(path, filename: path.split('/').last),
      'title': task.title,
      'desc': task.desc,
      'priority': task.priority,
      'dueDate': task.dueDate
    });
    final response = await apiServices.postRequest(
        endpoint: 'todos',
        data: fromData,
        options: Options(headers: {'Content-Type': 'multipart/form-data'}));
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
}
