import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jop_task/featurs/task/data/models/task_model.dart';
import 'package:jop_task/featurs/task/data/repo.dart';
import 'package:jop_task/featurs/task/logic/state.dart';

class TaskCubit extends Cubit<TaskStates> {
  final TaskRepo taskRepo;

  TaskCubit({required this.taskRepo}) : super(TaskStates());

  void updatePriority(String value) {
    emit(state.copyWith(
        taskStatus: TaskStatus.updatePriority, selectedPriority: value));
  }

  Future<void> pickeDate(BuildContext context) async {
    DateTime dateTime = DateTime.now();
    DateTime? pickd = await showDatePicker(
      context: context,
      initialDate: state.selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
    );
    if (pickd != null && pickd != dateTime) {
      String formattedDate = DateFormat('d-M-yyyy').format(pickd);
      pickd = dateTime;
      emit(
        state.copyWith(
          taskStatus: TaskStatus.selectedDate,
          selectedDate: pickd,
          dataFormat: formattedDate
        ),
      );
    }
  }

  final ImagePicker picker = ImagePicker();
  XFile? selectedImage;

  void chooseImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage = image;
      debugPrint('choose Image Successfully : ${image.path}');
    }
  }

  Future<void> addTask(TaskModel task) async {
    emit(state.copyWith(taskStatus: TaskStatus.loading));
      (await taskRepo.addTask(
              path: selectedImage!.path,
              task: task))
          .fold(
        (error) => emit(
            state.copyWith(taskStatus: TaskStatus.error, errorMessage: error)),
        (success) => emit(
          state.copyWith(
            taskStatus: TaskStatus.success,
          ),
        ),
      );

  }
}
