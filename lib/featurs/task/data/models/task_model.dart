class TaskModel {
  String? image;
  String? title;
  String? desc;
  String? priority;
  String? status;
  String? user;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  TaskModel(
      {this.image,
      this.title,
      this.desc,
      this.priority,
      this.status,
      this.user,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  TaskModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    desc = json['desc'];
    priority = json['priority'];
    status = json['status'];
    user = json['user'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'desc': desc,
      'priority': priority,
      'status': status,
      'user': user,
      '_id': sId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': iV,
    };
  }
}
