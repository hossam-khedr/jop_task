import 'package:jop_task/featurs/task/data/models/task_model.dart';

enum TaskDetailsEnum {
  init,
  getDetailsLoading,
  getDetailsError,
  getDetailsSuccess,
  updatePriority,
  updateTaskStatus,
  updateDateTime,
  deleteTaskLoading,
  deleteTaskError,
  deleteTaskSuccess,
}

extension TaskDetailsExtension on TaskDetailsStates {
  get isInit => taskDetailsEnum == TaskDetailsEnum.init;
  get isUpdateStatus => taskDetailsEnum == TaskDetailsEnum.updateTaskStatus;
  get isupdatePriority => taskDetailsEnum == TaskDetailsEnum.updatePriority;
  get isupdateDateTime => taskDetailsEnum == TaskDetailsEnum.updateDateTime;
  get isDeleteTaskLoading => taskDetailsEnum == TaskDetailsEnum.deleteTaskLoading;
  get isDeleteTaskError => taskDetailsEnum == TaskDetailsEnum.deleteTaskError;
  get isDeleteTaskSuccess => taskDetailsEnum == TaskDetailsEnum.deleteTaskSuccess;
  get isGetDetailsLoading =>
      taskDetailsEnum == TaskDetailsEnum.getDetailsLoading;
  get isGetDetailsError => taskDetailsEnum == TaskDetailsEnum.getDetailsError;
  get isGetDetailsSuccess =>
      taskDetailsEnum == TaskDetailsEnum.getDetailsSuccess;
}

class TaskDetailsStates {
  TaskDetailsEnum taskDetailsEnum;
  String errorMasg;
  TaskModel?model;
  List<String>taskStatus;
  List<String>priority;
  String initpriority;
  String initTaskStatus;
  DateTime?selectedDate;
  String dateFormate;

  TaskDetailsStates({
    this.taskDetailsEnum = TaskDetailsEnum.init,
    this.errorMasg = '',
    this.model,
    this.taskStatus =const ['Waiting', 'InProgress', 'Finished'],
    this.priority = const ['low', 'medium', 'heigt'],
    this.initpriority = 'low',
    this.initTaskStatus = 'Waiting',
    this.selectedDate,
    this.dateFormate = ''
  });

  TaskDetailsStates copyWith({
    TaskDetailsEnum? taskDetailsEnum,
    String? errorMasg,
    TaskModel?model,
    List<String>?taskStatus,
  List<String>?priority,
  String? initpriority,
  String? initTaskStatus,
  String? dateFormate,
  DateTime?selectedDate
    
  }) {
    return TaskDetailsStates(
      taskDetailsEnum: taskDetailsEnum ?? this.taskDetailsEnum,
      errorMasg: errorMasg ?? this.errorMasg,
      model: model ?? this.model,
      initTaskStatus: initTaskStatus ?? this.initTaskStatus,
      initpriority: initpriority ?? this.initpriority,
      taskStatus: taskStatus ?? this.taskStatus,
      priority: priority?? this.priority,
      selectedDate:  selectedDate ?? this.selectedDate,
      dateFormate: dateFormate ?? this.dateFormate,
    );
  }
}
