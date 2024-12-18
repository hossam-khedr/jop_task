import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:jop_task/featurs/task/data/data_source.dart';
import 'package:jop_task/featurs/task/data/models/task_model.dart';

class TaskRepo{
  final TaskDatasource taskDatasource;
  TaskRepo({required this.taskDatasource});

  Future<Either<String,void>>addTask(
      {required String path,required TaskModel task})async{
    try{
      await taskDatasource.addTask(path,task);
      return const Right(null);
    }catch(e){
      debugPrint('ADD TASK ERROR : ${e.toString()}');
      return Left(e.toString());
    }
  }
}