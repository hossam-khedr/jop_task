import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jop_task/featurs/task/ui/screens/add_task/logic/states.dart';
import 'package:image/image.dart' as img;
import '../../../../../../core/params/create_task_params.dart';
import '../../../../data/repo.dart';

class AddTaskCubit extends Cubit<AddTaskStates> {
  final TaskRepo taskRepo;

  AddTaskCubit({required this.taskRepo}) : super(AddTaskStates());

  void resetState(){
if(!isClosed){
  emit(state.copyWith(addTaskEnum: AddTaskEnum.init));
}
  }

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

//? this method is responsible on image to sever
 Future<void> uploadImage(File file) async {
  debugPrint('UPLOAD ==============================================1');

  if (!isClosed) {
    emit(state.copyWith(addTaskEnum: AddTaskEnum.uploadImageLoading));
  }

  try {
    
    if (!file.existsSync()) {
      debugPrint('Error: File does not exist.');
      if (!isClosed) {
        emit(state.copyWith(
            addTaskEnum: AddTaskEnum.uploadImageError,
            errorMsg: 'File does not exist.'));
      }
      return;
    }

    final result = await taskRepo.uploadImage(file);
    result.fold(
      (error) {
        
        if (!isClosed) {
          emit(state.copyWith(
              addTaskEnum: AddTaskEnum.uploadImageError, errorMsg: error));
        }
        debugPrint('UPLOAD Error: $error');
      },
      (success) {
        
        if (!isClosed) {
          emit(state.copyWith(
              addTaskEnum: AddTaskEnum.uploadImageSuccess,
              selectedImage: file));
        }
        debugPrint('UPLOAD ==============================================3');
      },
    );
  } catch (e) {
    
    debugPrint('Error in uploadImage: $e');
    if (!isClosed) {
      emit(state.copyWith(
          addTaskEnum: AddTaskEnum.uploadImageError,
          errorMsg: 'Unexpected error occurred during upload.'));
    }
  }
}


  //? this method responsible on compression the image
  void imageCompression(File originalFile)  {
  debugPrint('Compression ==============================================1');
  debugPrint('Original size: ${originalFile.lengthSync()} bytes');

  final img.Image? imageTamp = img.decodeImage(originalFile.readAsBytesSync());
  if (imageTamp != null) {
    debugPrint('Original dimensions: ${imageTamp.width}x${imageTamp.height}');

  
    final img.Image compressedTemp = img.copyResize(
      imageTamp,
      width: 400,
      height: 400,
    );
    debugPrint('Compression ==============================================2');

   
    final String compressedPath = '${originalFile.parent.path}/compressed_${DateTime.now().millisecondsSinceEpoch}.png';
    File compressedFile = File(compressedPath)
      ..writeAsBytesSync(img.encodePng(compressedTemp,));

    debugPrint('Compressed size: ${compressedFile.lengthSync()} bytes');
    debugPrint('Compressed dimensions: ${compressedTemp.width}x${compressedTemp.height}');

    if (!isClosed) {
      debugPrint('Compression ==============================================3');
      emit(state.copyWith(selectedImage: compressedFile));
    }
  }
}

  //?this method responsible on choose the image then upload the image
  Future<void> chooseImage() async {
    debugPrint('CHOOSE ==============================================1');
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      state.selectedImage= File(image.path);
       

      if (state.selectedImage != null) {
        imageCompression(state.selectedImage!);
        await uploadImage(state.selectedImage!);
        debugPrint(
            'Image compressed successfully: ${state.selectedImage?.path.split('/').last}');
      } else {
        debugPrint('Selected Image Error');
      }
    }
  }

  Future<void> addTask(CreateTaskParams params) async {
    // if (state.selectedImage == null) {
    //   if (!isClosed) {
    //     emit(state.copyWith(
    //         addTaskEnum: AddTaskEnum.selectedImageError,
    //         errorMsg: 'Plays choose the image'));
    //   }

    //   return;
    // }
    if (!isClosed) {
      emit(state.copyWith(
        addTaskEnum: AddTaskEnum.createTaskLoading,
      ));
    }

    (await taskRepo.addTask(
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
      resetState();
    });
  }
}
