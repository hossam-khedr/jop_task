import 'dart:io';

enum AddTaskEnum{
  init,
  createTaskSuccess,
  crateTaskError,
  createTaskLoading,
  selectedImageError,
  updatePriority,
  selectedDate,
  uploadImageSuccess,
  uploadImageError,
  uploadImageLoading,
}
extension AddTaskStateExtension on AddTaskStates{
  get isInit => addTaskEnum == AddTaskEnum.init;
  get isSelectedImageError => addTaskEnum == AddTaskEnum.selectedImageError;
  get isCreateTaskLoading => addTaskEnum == AddTaskEnum.createTaskLoading;
  get isCreateTaskError => addTaskEnum == AddTaskEnum.crateTaskError;
  get isCreateTaskSuccess => addTaskEnum == AddTaskEnum.createTaskSuccess;
  get isImageUploaded => addTaskEnum == AddTaskEnum.uploadImageSuccess;
  get isImageUploadError => addTaskEnum == AddTaskEnum.uploadImageError;
  get isImageUploadLoading => addTaskEnum == AddTaskEnum.uploadImageLoading;
}

class AddTaskStates{
  final AddTaskEnum addTaskEnum;
  final String errorMsg;
  final DateTime? selectedDate;
  final String dataFormat;
  File? selectedImage;
  final String selectedPriority;
  AddTaskStates({
    this.addTaskEnum = AddTaskEnum.init,
    this.errorMsg = '',
    this.selectedDate,
    this.dataFormat = '',
    this.selectedImage,
    this.selectedPriority = 'low'
});
  AddTaskStates copyWith ({
     AddTaskEnum? addTaskEnum,
     String? errorMsg,
     DateTime? selectedDate,
     String? dataFormat,
    File? selectedImage,
     String? selectedPriority,
}){
    return AddTaskStates(
      addTaskEnum: addTaskEnum ?? this.addTaskEnum,
      errorMsg: errorMsg ?? this.errorMsg,
      dataFormat: dataFormat ?? this.dataFormat,
      selectedDate: selectedDate ?? this.selectedDate,
      selectedImage: selectedImage ?? this.selectedImage,
      selectedPriority: selectedPriority ?? this.selectedPriority
    );
  }
}