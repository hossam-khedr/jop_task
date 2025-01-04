import 'dart:io';

import 'package:jop_task/core/params/create_task_params.dart';

abstract class TaskDatasource{
  Future<dynamic>addTask(CreateTaskParams params);
  Future<dynamic>uploadImage(File imagePath);
  Future<dynamic>logout();
  Future<dynamic>getUserInfo();
  Future<dynamic>getTasks(int pageNumber);
  Future<dynamic>getTaskInfo(String id);
  Future<dynamic>deleteTask(String id);
}