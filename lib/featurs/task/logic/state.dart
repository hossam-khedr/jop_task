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

  TaskStates({
    this.taskStatus = TaskStatus.init,
    this.errorMessage,
    this.selectedPriority = 'Low Priority',
    this.imagePath = '',
    this.selectedDate,
    this.dataFormat = '',
  });

  TaskStates copyWith(
      {TaskStatus? taskStatus,
      String? errorMessage,
      String? selectedPriority,
      String? imagePath,
      DateTime? selectedDate,
      String? dataFormat}) {
    return TaskStates(
      taskStatus: taskStatus ?? this.taskStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedPriority: selectedPriority ?? this.selectedPriority,
      imagePath: imagePath ?? this.imagePath,
      selectedDate: selectedDate ?? this.selectedDate,
      dataFormat: dataFormat ?? this.dataFormat,
    );
  }
}
