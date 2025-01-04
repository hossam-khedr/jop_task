import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:jop_task/featurs/task/data/repo.dart';
import 'package:jop_task/featurs/task/ui/screens/details/logic/states.dart';

class TaskDetailsCubit extends Cubit<TaskDetailsStates> {
  final TaskRepo taskRepo;
  TaskDetailsCubit({required this.taskRepo}) : super(TaskDetailsStates());

  Future<void> pickeDate(BuildContext context) async {
    DateTime dateTime = DateTime.now();
    DateTime? pickd = await showDatePicker(
      context: context,
      initialDate: state.selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
    );
    if (pickd != null && pickd != dateTime) {
      String formattedDate = DateFormat("d MMMM, y").format(pickd);
      pickd = dateTime;
      if (!isClosed) {
        emit(
          state.copyWith(
              taskDetailsEnum: TaskDetailsEnum.updateDateTime,
              selectedDate: pickd,
              dateFormate: formattedDate),
        );
      }
    }
  }

  void updatePriority(String value) {
    if (!isClosed) {
      emit(
        state.copyWith(
          taskDetailsEnum: TaskDetailsEnum.updatePriority,
          initpriority: value,
        ),
      );
    }
  }

  void updateTaskStatus(String value) {
    if (!isClosed) {
      emit(
        state.copyWith(
          taskDetailsEnum: TaskDetailsEnum.updateTaskStatus,
          initTaskStatus: value,
        ),
      );
    }
  }

  Future<void> getTaskInfo(String taskId) async {
    if (!isClosed) {
      emit(state.copyWith(taskDetailsEnum: TaskDetailsEnum.getDetailsLoading));

      (await taskRepo.getTaskInfo(taskId)).fold(
        (error) {
          if (!isClosed) {
            emit(state.copyWith(
              taskDetailsEnum: TaskDetailsEnum.getDetailsError,
              errorMasg: error,
            ));
          }
        },
        (success) {
          if (!isClosed) {
            emit(state.copyWith(
                taskDetailsEnum: TaskDetailsEnum.getDetailsSuccess,
                model: success));
          }
        },
      );
    }
  }

  Future<void> deleteTask(String taskId) async {
    if (!isClosed) {
      emit(
        state.copyWith(
          taskDetailsEnum: TaskDetailsEnum.deleteTaskLoading,
        ),
      );
    }

    (await taskRepo.deleteTask(taskId)).fold(
      (error) {
        if (!isClosed) {
          emit(
            state.copyWith(
              taskDetailsEnum: TaskDetailsEnum.deleteTaskError,
              errorMasg: error,
            ),
          );
        }
      },
      (success) {
        if (!isClosed) {
          emit(
            state.copyWith(
              taskDetailsEnum: TaskDetailsEnum.deleteTaskSuccess,
            ),
          );
        }
      },
    );
  }
}
