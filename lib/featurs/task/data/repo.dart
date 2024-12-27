import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:jop_task/featurs/auth/data/models/register_model.dart';
import 'package:jop_task/featurs/task/data/data_source.dart';
import 'package:jop_task/featurs/task/data/models/task_model.dart';
import 'package:jop_task/featurs/task/data/models/user_model.dart';

import '../../../core/params/create_task_params.dart';

class TaskRepo{
  final TaskDatasource taskDatasource;
  TaskRepo({required this.taskDatasource});

  Future<Either<String,void>>addTask(
      {required String path,required CreateTaskParams params})async{
    try{
      await taskDatasource.addTask(path,params);
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



}