import 'package:jop_task/featurs/auth/data/models/register_model.dart';

enum TaskStatus {
  init,
  loading,
  error,
  success,
  updatePriority,
  selectedDate,
}

extension TaskExtension on TaskStates {
  get isInit => taskStatus == TaskStatus.init;

  get isLoading => taskStatus == TaskStatus.loading;

  get isError => taskStatus == TaskStatus.error;

  get isSuccess => taskStatus == TaskStatus.success;
}

class TaskStates {
  final TaskStatus taskStatus;
  final String? errorMessage;
  final String selectedPriority;
  final String imagePath;
  final DateTime? selectedDate;
  final String dataFormat;
  final RegisterModel? model;


  TaskStates({
    this.taskStatus = TaskStatus.init,
    this.errorMessage,
    this.selectedPriority = 'Low Priority',
    this.imagePath = '',
    this.selectedDate,
    this.dataFormat = '',
    this.model,
  });

  TaskStates copyWith(
      {TaskStatus? taskStatus,
      String? errorMessage,
      String? selectedPriority,
      String? imagePath,
      DateTime? selectedDate,
      String? dataFormat,
        RegisterModel? model,
      }) {
    return TaskStates(
      taskStatus: taskStatus ?? this.taskStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedPriority: selectedPriority ?? this.selectedPriority,
      imagePath: imagePath ?? this.imagePath,
      selectedDate: selectedDate ?? this.selectedDate,
      dataFormat: dataFormat ?? this.dataFormat,
      model: model ?? this.model
    );
  }
}
