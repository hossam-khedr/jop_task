class UserModel{
  String? userId;
  String? displayName;
  String? username;
  List<String>? roles;
  bool? active;
  int? experienceYears;
  String? address;
  String? level;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserModel(
      {this.userId,
        this.displayName,
        this.username,
        this.roles,
        this.active,
        this.experienceYears,
        this.address,
        this.level,
        this.createdAt,
        this.updatedAt,
        this.iV});

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['_id'];
    displayName = json['displayName'];
    username = json['username'];
    roles = json['roles'].cast<String>();
    active = json['active'];
    experienceYears = json['experienceYears'];
    address = json['address'];
    level = json['level'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    return{
    '_id':userId,
    'displayName' : displayName,
    'username' : username,
    'roles' : roles,
    'active' : active,
    'experienceYears' : experienceYears,
    'address' : address,
    'level' : level,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt,
    '__v' : iV,
    };


  }
}