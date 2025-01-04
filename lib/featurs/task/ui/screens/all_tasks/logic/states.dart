import '../../../../data/models/task_model.dart';

enum TasksEnum{
  init,
  logoutLoading,
  logoutError,
  logoutSuccess,
  getTasksError,
  getTasksLoading,
  getTasksSuccess,
}
extension TasksExtension on TasksStates{
  get isLogoutLoading => tasksEnum == TasksEnum.logoutLoading;
  get isLogoutError => tasksEnum == TasksEnum.logoutError;
  get isLogoutSuccess => tasksEnum == TasksEnum.logoutSuccess;
  get isGetTasksError => tasksEnum == TasksEnum.getTasksError;
  get isGetTasksLoading => tasksEnum == TasksEnum.getTasksLoading;
  get isGetTasksSuccess => tasksEnum == TasksEnum.getTasksSuccess;
}

class TasksStates{
  TasksEnum tasksEnum;
  String errorMsg;
  final List<TaskModel>tasks;
  final List<TaskModel>inProgressList;
  final List<TaskModel>waitingList;
  TasksStates({
    this.tasksEnum = TasksEnum.init,
    this.errorMsg = '',
    this.tasks = const[],
    this.inProgressList =const [],
    this.waitingList = const [],
});

  TasksStates copyWith({
    TasksEnum? tasksEnum,
    String? errorMsg,
     List<TaskModel>?tasks,
     List<TaskModel>?inProgressList,
      List<TaskModel>?waitingList
}){
    return TasksStates(
      tasksEnum: tasksEnum ??this.tasksEnum,
      errorMsg: errorMsg ?? this.errorMsg,
      tasks: tasks ?? List.from(this.tasks),
      inProgressList: inProgressList ?? List.from(this.inProgressList),
      waitingList: waitingList ?? List.from(this.waitingList),
    );
  }
}