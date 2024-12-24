import 'package:jop_task/featurs/auth/data/models/register_model.dart';

enum TaskStatus {
  init,

  logoutLoading,
  logoutError,
  logoutSuccess,
 selectedImageError,
  createTaskSuccess,
  crateTaskError,
  createTaskLoading,
  updatePriority,
  selectedDate,
  scanningSuccess,
  getUserInfoLoading,
  getUserInfoError,
  getUserInfoSuccess,
}

extension TaskExtension on TaskStates {
  get isInit => taskStatus == TaskStatus.init;
  get isScanningSuccess => taskStatus == TaskStatus.scanningSuccess;
  get isSelectedImageError => taskStatus == TaskStatus.selectedImageError;
  // logout state
  get isLogoutLoading => taskStatus == TaskStatus.logoutLoading;
  get isLogoutError => taskStatus == TaskStatus.logoutError;
  get isLogoutSuccess => taskStatus == TaskStatus.logoutSuccess;

  // create task state
  get isCreateTaskLoading => taskStatus == TaskStatus.createTaskLoading;
  get isCreateTaskError => taskStatus == TaskStatus.crateTaskError;
  get isCreateTaskSuccess => taskStatus == TaskStatus.createTaskSuccess;

  get isGetUserInfoLoading => taskStatus == TaskStatus.getUserInfoLoading;
  get isGetUserInfoError => taskStatus == TaskStatus.getUserInfoError;
  get isGetUserInfoSuccess => taskStatus == TaskStatus.getUserInfoSuccess;
}

class TaskStates {
  final TaskStatus taskStatus;
  final String? errorMessage;
  final String selectedPriority;
  final String imagePath;
  final DateTime? selectedDate;
  final String dataFormat;
  final RegisterModel? model;
  final String scannedData;
  final bool isScanning;


  TaskStates({
    this.taskStatus = TaskStatus.init,
    this.errorMessage,
    this.selectedPriority = 'Low Priority',
    this.imagePath = '',
    this.selectedDate,
    this.dataFormat = '',
    this.model,
    this.scannedData = '',
    this.isScanning = false,
  });

  TaskStates copyWith(
      {TaskStatus? taskStatus,
      String? errorMessage,
      String? selectedPriority,
      String? imagePath,
      DateTime? selectedDate,
      String? dataFormat,
        RegisterModel? model,
         String? scannedData,
         bool? isScanning
      }) {
    return TaskStates(
      taskStatus: taskStatus ?? this.taskStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedPriority: selectedPriority ?? this.selectedPriority,
      imagePath: imagePath ?? this.imagePath,
      selectedDate: selectedDate ?? this.selectedDate,
      dataFormat: dataFormat ?? this.dataFormat,
      model: model ?? this.model,
      scannedData: scannedData?? this.scannedData,
      isScanning: isScanning ?? this.isScanning,
    );
  }
}
