class ReturnModel {
  ReturnModel({required this.message, required this.status});
  late final String message;
  late final bool status;

  ReturnModel.fromJson(Map<String, dynamic> json) {
    message = json['message'] ?? "";
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class ReturnAttendanceModel {
  ReturnAttendanceModel({required this.message, required this.status});
  late final String message;
  late final bool status;

  ReturnAttendanceModel.fromJson(Map<String, dynamic> json) {
    message = json['returnMessage'] ?? "";
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['returnMessage'] = message;
    data['status'] = status;
    return data;
  }
}

class ReturnModeluser {
  ReturnModeluser({
    required this.message,
    required this.status,
    required this.model,
  });
  late final String message;
  late final bool status;
  late final Model model;

  ReturnModeluser.fromJson(Map<String, dynamic> json) {
    message = json['message'] ?? "";
    status = json['status'];
    model = Model.fromJson(json['model']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    data['model'] = model.toJson();
    return data;
  }
}

class Model {
  Model({required this.message, required this.status, required this.userModel});
  late final String message;
  late final bool status;
  late final UserModel userModel;

  Model.fromJson(Map<String, dynamic> json) {
    message = json['message'] ?? "";
    status = json['status'];
    userModel = UserModel.fromJson(json['userModel']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    data['userModel'] = userModel.toJson();
    return data;
  }
}

class UserModel {
  UserModel({required this.isStudent, required this.isCompleted});
  late final bool isStudent;
  late final bool isCompleted;

  UserModel.fromJson(Map<String, dynamic> json) {
    isStudent = json['isStudent'];
    isCompleted = json['isCompleted'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['isStudent'] = isStudent;
    data['isCompleted'] = isCompleted;
    return data;
  }
}
