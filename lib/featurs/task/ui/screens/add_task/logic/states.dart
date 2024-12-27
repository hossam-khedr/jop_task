import 'dart:io';

enum AddTaskEnum{
  init,
  createTaskSuccess,
  crateTaskError,
  createTaskLoading,
  selectedImageError,
  updatePriority,
  selectedDate,
}
extension AddTaskStateExtension on AddTaskStates{
  get isInit => addTaskEnum == AddTaskEnum.init;
  get isSelectedImageError => addTaskEnum == AddTaskEnum.selectedImageError;
  get isCreateTaskLoading => addTaskEnum == AddTaskEnum.createTaskLoading;
  get isCreateTaskError => addTaskEnum == AddTaskEnum.crateTaskError;
  get isCreateTaskSuccess => addTaskEnum == AddTaskEnum.createTaskSuccess;
}

class AddTaskStates{
  final AddTaskEnum addTaskEnum;
  final String errorMsg;
  final DateTime? selectedDate;
  final String dataFormat;
  File? compressedImage;
  final String selectedPriority;
  AddTaskStates({
    this.addTaskEnum = AddTaskEnum.init,
    this.errorMsg = '',
    this.selectedDate,
    this.dataFormat = '',
    this.compressedImage,
    this.selectedPriority = 'Low Priority'
});
  AddTaskStates copyWith ({
     AddTaskEnum? addTaskEnum,
     String? errorMsg,
     DateTime? selectedDate,
     String? dataFormat,
    File? compressedImage,
     String? selectedPriority,
}){
    return AddTaskStates(
      addTaskEnum: addTaskEnum ?? this.addTaskEnum,
      errorMsg: errorMsg ?? this.errorMsg,
      dataFormat: dataFormat ?? this.dataFormat,
      selectedDate: selectedDate ?? this.selectedDate,
      compressedImage: compressedImage ?? this.compressedImage,
      selectedPriority: selectedPriority ?? this.selectedPriority
    );
  }
}