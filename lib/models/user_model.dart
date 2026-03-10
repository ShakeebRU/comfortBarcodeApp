class UserResponseModel {
  UserResponseModel({
    required this.status,
    required this.message,
    required this.logindata,
  });
  late final bool status;
  late final String message;
  late final UserModel logindata;

  UserResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    logindata = UserModel.fromJson(json['logindata']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['logindata'] = logindata.toJson();
    return _data;
  }
}

class UserModel {
  UserModel({
    required this.token,
    required this.beareartoken,
    required this.expiration,
    required this.employeeCode,
    required this.userId,
    required this.departmentCode,
    required this.departmentAdmin,
    required this.password,
    required this.addDateTime,
  });
  late final String token;
  late final String beareartoken;
  late final String expiration;
  late final int employeeCode;
  late final String userId;
  late final int departmentCode;
  late final bool departmentAdmin;
  late final String password;
  late final String addDateTime;

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    beareartoken = json['beareartoken'];
    expiration = json['expiration'];
    employeeCode = json['employeeCode'];
    userId = json['userId'];
    departmentCode = json['departmentCode'];
    departmentAdmin = json['departmentAdmin'];
    password = json['password'];
    addDateTime = json['addDateTime'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['beareartoken'] = beareartoken;
    _data['expiration'] = expiration;
    _data['employeeCode'] = employeeCode;
    _data['userId'] = userId;
    _data['departmentCode'] = departmentCode;
    _data['departmentAdmin'] = departmentAdmin;
    _data['password'] = password;
    _data['addDateTime'] = addDateTime;
    return _data;
  }
}
