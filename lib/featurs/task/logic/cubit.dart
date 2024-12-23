import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jop_task/core/networking/api_services/api_services.dart';
import 'package:jop_task/core/token_manager.dart';
import 'package:jop_task/featurs/task/data/models/task_model.dart';
import 'package:jop_task/featurs/task/data/repo.dart';
import 'package:jop_task/featurs/task/logic/state.dart';
import 'package:image/image.dart' as img;

import '../../../core/di.dart';

class TaskCubit extends Cubit<TaskStates> {
  final TaskRepo taskRepo;

  TaskCubit({required this.taskRepo}) : super(TaskStates());

  void updatePriority(String value) {
    if(!isClosed){
      emit(state.copyWith(
          taskStatus: TaskStatus.updatePriority, selectedPriority: value));
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
              taskStatus: TaskStatus.selectedDate,
              selectedDate: pickd,
              dataFormat: formattedDate),
        );
      }
    }
  }

  final ImagePicker picker = ImagePicker();
  XFile? selectedImage;
  File? compressedImage;

  void chooseImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage = image;

      File originalFile = File(image.path);
      final img.Image? imageTamp =
          img.decodeImage(await originalFile.readAsBytesSync());
      if (imageTamp != null) {
        final img.Image compressedTemp =
            img.copyResize(imageTamp, width: 800, height: 600);
        compressedImage = File(originalFile.path)
          ..writeAsBytesSync(img.encodeJpg(compressedTemp, quality: 70));
      }
      debugPrint('Image compressed successfully: ${compressedImage?.path}');
    }
  }



  Future<void> addTask(TaskModel task) async {
    if (selectedImage == null || compressedImage == null) {
      if (!isClosed) {
        emit(state.copyWith(
            taskStatus: TaskStatus.selectedImageError,
            errorMessage: 'Plays choose the image'));
      }

      return;
    }
    if (!isClosed) {
      emit(state.copyWith(taskStatus: TaskStatus.createTaskLoading));
    }

    (await taskRepo.addTask(path: compressedImage!.path, task: task)).fold(
        (error) {
      if (!isClosed) {
        emit(
          state.copyWith(
            taskStatus: TaskStatus.crateTaskError,
            errorMessage: error,
          ),
        );
      }
    }, (success) {
      if (!isClosed) {
        emit(state.copyWith(taskStatus: TaskStatus.createTaskSuccess));
      }
    });
  }

  Future<void> logout() async {
    if (!isClosed) {
      emit(state.copyWith(taskStatus: TaskStatus.logoutLoading));
    }

    (await taskRepo.logout()).fold((error) {
      if (!isClosed) {
        emit(state.copyWith(
            taskStatus: TaskStatus.logoutError, errorMessage: error));
      }
    }, (success) {
      if (!isClosed) {
        emit(
          state.copyWith(
            taskStatus: TaskStatus.logoutSuccess,
          ),
        );
      }
    });
  }

  Future<void> getUserInfo() async {
    if (!isClosed) {
      emit(state.copyWith(taskStatus: TaskStatus.getUserInfoLoading));
    }
    (await taskRepo.getUserInfo()).fold((error) {
      if (!isClosed) {
        emit(state.copyWith(
            taskStatus: TaskStatus.getUserInfoError, errorMessage: error));
      }
    }, (data) {
      if (!isClosed) {
        emit(
          state.copyWith(
              taskStatus: TaskStatus.getUserInfoSuccess, model: data),
        );
      }
    });
  }

  void setScannedData(String data) {
    if (!isClosed) {
      emit(state.copyWith(
          taskStatus: TaskStatus.scanningSuccess, scannedData: data));
    }
  }
}
