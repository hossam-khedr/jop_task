import 'package:jop_task/core/params/create_task_params.dart';

abstract class TaskDatasource{
  Future<dynamic>addTask(String path,CreateTaskParams params);
  Future<dynamic>logout();
  Future<dynamic>getUserInfo();
  Future<dynamic>getTasks(int pageNumber);
}