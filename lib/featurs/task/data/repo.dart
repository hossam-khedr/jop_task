import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:jop_task/featurs/task/data/data_source.dart';
import 'package:jop_task/featurs/task/data/models/task_model.dart';
import 'package:jop_task/featurs/task/data/models/user_model.dart';

import '../../../core/params/create_task_params.dart';

class TaskRepo{
  final TaskDatasource taskDatasource;
  TaskRepo({required this.taskDatasource});

  Future<Either<String,void>>addTask(
      {required CreateTaskParams params})async{
    try{
      await taskDatasource.addTask(params);
      return const Right(null);
    }catch(e){
      debugPrint('ADD TASK ERROR : ${e.toString()}');
      return Left(e.toString());
    }
  }
  Future<Either<String,void>>logout(
      )async{
    try{
      await taskDatasource.logout();
      return const Right(null);
    }catch(e){
      debugPrint('LOGOUT ERROR : ${e.toString()}');
      return Left(e.toString());
    }
  }
  Future<Either<String,UserModel>>getUserInfo()async {
    try {
      final response = await taskDatasource.getUserInfo();
      final model = response.data as Map<String, dynamic>;
      final result = UserModel.fromJson(model);
      return Right(result);
    } catch (error) {
      debugPrint('GET INFO ERROR : ${error.toString()}');
      return Left(error.toString());
    }
  }
  Future<Either<String,List<TaskModel>>>getAllTasks(int page)async{
    try{
      final response = await taskDatasource.getTasks(page);
      var model = response.data as List;
      List<TaskModel> tasks = model.map((m)=>TaskModel.fromJson(m)).toList();
      return Right(tasks);
    }catch(e){
      debugPrint('GET TASKS ERROR ${e.toString()}');
      return Left(e.toString());
    }
  }
Future<Either<String,void>>uploadImage(File imagePath)async{
    try{
      await taskDatasource.uploadImage(imagePath);
      return const Right(null);
    }catch(e){
      debugPrint('Error uploading image repo: $e');
      return Left(e.toString());
    }
}

Future<Either<String,TaskModel>>getTaskInfo(String taskId)async{
  try{
   final response =  await taskDatasource.getTaskInfo(taskId);
   final data = response.data as Map<String,dynamic>;
   debugPrint('Task Details Repo ====================== :$data');
   final model = TaskModel.fromJson(data);
    return  Right(model);
  }catch(e){
    return Left(e.toString());
  }

}
Future<Either<String,void>>deleteTask(String taskId)async{
  try{
    await taskDatasource.deleteTask(taskId);
    return  const Right(null);
  }catch(e){
    return Left(e.toString());
  }

}


}