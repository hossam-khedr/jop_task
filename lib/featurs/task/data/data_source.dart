import 'package:jop_task/featurs/task/data/models/task_model.dart';

abstract class TaskDatasource{
  Future<dynamic>addTask(String path,TaskModel task);
}