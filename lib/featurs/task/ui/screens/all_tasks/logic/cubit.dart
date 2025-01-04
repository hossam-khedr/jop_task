import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jop_task/featurs/task/data/repo.dart';
import 'package:jop_task/featurs/task/ui/screens/all_tasks/logic/states.dart';

import '../../../../../../core/app_constants.dart';
import '../../../../../../core/secure_manager.dart';
import '../../../../data/models/task_model.dart';

class TasksCubit extends Cubit<TasksStates>{
  final TaskRepo taskRepo;
  TasksCubit({required this.taskRepo}):super(TasksStates());

  Future<void> logout() async {
    if (!isClosed) {
      emit(state.copyWith(tasksEnum: TasksEnum.logoutLoading));
    }

    (await taskRepo.logout()).fold(
          (error) {
        if (!isClosed) {
          emit(state.copyWith(
              tasksEnum: TasksEnum.logoutError, errorMsg: error));
        }
      },
          (success) async {
        if (!isClosed) {
          emit(
            state.copyWith(
              tasksEnum: TasksEnum.logoutSuccess,
            ),
          );
        }
        await SecureManager.deleteValue(AppConstants.accessToken);
        debugPrint("Logout successfully");
      },
    );
  }
  int pageNumber = 1;

  Future<void> getAllTasks() async {
    var tasksList = state.tasks.toList();
    if (!isClosed) {
      emit(state.copyWith(tasksEnum: TasksEnum.getTasksLoading));
    }
    (await taskRepo.getAllTasks(pageNumber)).fold(
          (error) {
        if (!isClosed) {
          emit(state.copyWith(
              tasksEnum: TasksEnum.getTasksError, errorMsg: error));
        }
      },
          (tasks) {
        tasksList.addAll(tasks);
        if (tasks.isNotEmpty) {
          pageNumber++;
        }
        if (!isClosed) {
          emit(
            state.copyWith(
                tasksEnum: TasksEnum.getTasksSuccess, tasks: tasksList),
          );
        }
      },
    );
  }

  List<TaskModel> getInProgressTask(String status) {
    final allTasks = state.tasks.toList();
    var inProgress = state.inProgressList.toList();
    inProgress = allTasks
        .where((element) =>
        element.status!.toLowerCase().contains(status.toLowerCase()))
        .toList();
    if(!isClosed){
      emit(state.copyWith(
          tasksEnum: TasksEnum.getTasksSuccess, inProgressList: inProgress));
    }
    return inProgress;
  }

  List<TaskModel> getInWaitingTask(String status) {
    final allTasks = state.tasks.toList();
    var waiting = state.waitingList.toList();
    waiting = allTasks
        .where((element) =>
        element.status!.toLowerCase().contains(status.toLowerCase()))
        .toList();
    if(!isClosed){
      emit(state.copyWith(
          tasksEnum: TasksEnum.getTasksSuccess, waitingList: waiting));
    }
    return waiting;
  }
}