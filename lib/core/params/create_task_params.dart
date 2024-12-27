class CreateTaskParams{
  String? image;
  String? title;
  String? desc;
  String? priority;
  String? dueDate;
  CreateTaskParams(
      {this.image, this.title, this.desc, this.priority, this.dueDate});
}