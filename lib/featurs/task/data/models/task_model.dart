import 'package:dio/dio.dart';

class TaskModel {
  String? image;
  String? title;
  String? desc;
  String? priority;
  String? dueDate;

  TaskModel(
      {this.image, this.title, this.desc, this.priority, this.dueDate});

  TaskModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    desc = json['desc'];
    priority = json['priority'];
    dueDate = json['dueDate'];
  }

  // Map<String, dynamic> toJson() {
  //   FormData  fromData = FromData
  //   // return{
  //   // 'image':image,
  //   // 'title':title,
  //   // 'desc':desc,
  //   // 'priority':priority,
  //   // 'dueDate':dueDate,
  //   // };
  //
  //
  // }
}
