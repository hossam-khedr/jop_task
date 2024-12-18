class RegisterModel {
  String? phone;
  String? password;
  String? displayName;
  int? experienceYears;
  String? address;
  String? level;

  RegisterModel(
      {this.phone,
        this.password,
        this.displayName,
        this.experienceYears,
        this.address,
        this.level});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    password = json['password'];
    displayName = json['displayName'];
    experienceYears = json['experienceYears'];
    address = json['address'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    return{
    'phone' : phone,
    'password' :password,
    'displayName':displayName,
    'experienceYears':experienceYears,
    'address':address,
    'level':level,
    };


  }
}
