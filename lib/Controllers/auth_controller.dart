import 'dart:convert';
import '../../Models/user_model.dart';
import '../../Utils/preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/return_model.dart';
import '../constants/apilinks.dart';
import '../constants/constants.dart';
import '../utils/utils.dart';
import '../views/screens/dashboard_screen.dart';

class AuthController with ChangeNotifier {
  bool isDark = false;
  void setIsDark(bool val) {
    isDark = val;
    notifyListeners();
  }

  bool isLoading = false;
  void setLoading(bool val) {
    isLoading = val;
    notifyListeners();
  }

  // 🔹 Login Function (Email & Password)
  Future<bool> login(
    BuildContext context,
    String email,
    String password,
  ) async {
    setLoading(true);
    String url = ApiLinks.userlogin;
    print(url);
    final response = await http.post(
      Uri.parse(url),
      headers: {'accept': '*/*', 'Content-Type': 'application/json'},
      body: jsonEncode({
        "employeeCode": 0,
        "userId": email,
        "departmentCode": 0,
        "departmentAdmin": true,
        "password": password,
        "addDateTime": "${DateTime.now().toString().replaceFirst(" ", "T")}Z",
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      ReturnModel check = ReturnModel.fromJson(jsonDecode(response.body));
      if (check.status) {
        print('✅ User login successfully');
        UserResponseModel userData = UserResponseModel.fromJson(
          jsonDecode(response.body),
        );
        await Preferences.init().then((onValue) => onValue.saveUser(userData));
        // await Preferences.init().then((onValue) => onValue.saveisErp(isERP));
        setLoading(false);

        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => DashboardScreen()),
          (route) => false,
        );
        return true;
      } else {
        Utils.showCustomSnackbar(
          context: context,
          title: "Error",
          message: check.message,
          backgroundColor: Constants.textColor,
        );
        setLoading(false);
        return false;
      }
    } else {
      print('❌ Login Failed: ${response.body}');

      Utils.showCustomSnackbar(
        context: context,
        title: "Error",
        message: jsonDecode(response.body),
        backgroundColor: Constants.textColor,
      );
      setLoading(false);
      return false;
    }
  }
}
