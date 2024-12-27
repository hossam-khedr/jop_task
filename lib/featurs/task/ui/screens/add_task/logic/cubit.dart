import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jop_task/featurs/task/ui/screens/add_task/logic/states.dart';

import '../../../../../../core/params/create_task_params.dart';
import '../../../../data/repo.dart';

class AddTaskCubit extends Cubit<AddTaskStates> {
  final TaskRepo taskRepo;

  AddTaskCubit({required this.taskRepo}) : super(AddTaskStates());

  void updatePriority(String value) {
    if (!isClosed) {
      emit(
        state.copyWith(
            addTaskEnum: AddTaskEnum.updatePriority, selectedPriority: value),
      );
    }
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
      String formattedDate = DateFormat('yyyy-M-d').format(pickd);
      pickd = dateTime;
      if (!isClosed) {
        emit(
          state.copyWith(
              addTaskEnum: AddTaskEnum.selectedDate,
              selectedDate: pickd,
              dataFormat: formattedDate),
        );
      }
    }
  }

  final ImagePicker picker = ImagePicker();

  Future<void> chooseImage() async {
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      state.compressedImage = File(image.path);

      // File originalFile = File(image.path);
      // final img.Image? imageTamp =
      //     img.decodeImage(originalFile.readAsBytesSync());
      // if (imageTamp != null) {
      //   final img.Image compressedTemp =
      //       img.copyResize(imageTamp, width: 800, height: 600);
      //   state.compressedImage = File(originalFile.path)
      //     ..writeAsBytesSync(img.encodeJpg(compressedTemp, quality: 70));
      // }
      debugPrint(
          'Image compressed successfully: ${state.compressedImage?.path}');
    }
  }

  Future<void> addTask(CreateTaskParams params) async {
    if (state.compressedImage == null) {
      if (!isClosed) {
        emit(state.copyWith(
            addTaskEnum: AddTaskEnum.selectedImageError,
            errorMsg: 'Plays choose the image'));
      }

      return;
    }
    if (!isClosed) {
      emit(state.copyWith(
        addTaskEnum: AddTaskEnum.createTaskLoading,
      ));
    }

    (await taskRepo.addTask(
      path: state.compressedImage!.path,
      params: params,
    ))
        .fold((error) {
      if (!isClosed) {
        emit(
          state.copyWith(
            addTaskEnum: AddTaskEnum.crateTaskError,
            errorMsg: error,
          ),
        );
      }
    }, (success) {
      if (!isClosed) {
        emit(state.copyWith(addTaskEnum: AddTaskEnum.createTaskSuccess));
      }
    });
  }
}
