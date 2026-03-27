import 'dart:convert';
import '../Models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  final SharedPreferences shared;
  Preferences(this.shared);

  UserResponseModel? getUser() {
    if (shared.getString("userAlneem") != null) {
      var str = shared.getString("userAlneem");
      UserResponseModel user = UserResponseModel.fromJson(jsonDecode(str!));
      return user;
    }
    return null;
  }

  Future saveUser(UserResponseModel user) async {
    shared.setString("userAlneem", jsonEncode(user));
  }

  Future deleteUser() async {
    shared.remove('userAlneem');
  }

  bool? getisErp() {
    if (shared.getBool("isErp") != null) {
      var val = shared.getBool("isErp");

      return val;
    }
    return null;
  }

  Future saveisErp(bool val) async {
    shared.setBool("isErp", val);
  }

  Future deleteisErp() async {
    shared.remove('isErp');
  }

  String? getInternetAddress() {
    if (shared.getString("baseUrl") != null) {
      var val = shared.getString("baseUrl");

      return val;
    }
    return null;
  }

  Future saveInternetAddress(String val) async {
    shared.setString("baseUrl", val);
  }

  Future deleteInternetAddress() async {
    shared.remove('baseUrl');
  }

  static Future<Preferences> init() =>
      SharedPreferences.getInstance().then((value) => Preferences(value));
}
