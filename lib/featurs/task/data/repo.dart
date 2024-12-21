import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:jop_task/featurs/auth/data/models/register_model.dart';
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
  Future<Either<String,RegisterModel>>getUserInfo()async{
    try{
      final response = await taskDatasource.getUserInfo();
      final model = response.data as Map<String,dynamic>;
      final result = RegisterModel.fromJson(model);
      return Right(result);

    }catch(error){
      debugPrint('GET INFO ERROR : ${error.toString()}');
      return Left(error.toString());
    }
  }
}