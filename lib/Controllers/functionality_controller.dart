import 'dart:convert';

import 'package:comfortbarcode/Models/return_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../Models/user_model.dart';
import '../Utils/preferences.dart';
import '../Utils/utils.dart';
import '../constants/apilinks.dart';

class FunctionalityController with ChangeNotifier {
  bool isLoading = false;
  void setLoading(bool val) {
    isLoading = val;
    notifyListeners();
  }

  Future saveScannedData(
    BuildContext context, {
    required int branchCode,
    required int ogpLocationID,
    required String locationCode,
    required int ogpFormNo,
    required int ogpSrNo,
    required int storeCode,
    required String itemCode,
    required double qty,
    required int colorCode,
    required String colorName,
    required int packingID,
  }) async {
    try {
      UserResponseModel? user = await Preferences.init().then(
        (onValue) => onValue.getUser(),
      );

      Position? pos = await Utils.getCurrentLocation();
      debugPrint(
        "${ApiLinks.savebarcodelocation}?userid=${user!.logindata.userId}",
      );
      Uri uri = Uri.parse(ApiLinks.savebarcodelocation);
      final Map<String, dynamic> body = {
        "branchCode": branchCode,
        "ogpLocationID": ogpLocationID,
        "locationCode": locationCode,
        "ogpFormNo": ogpFormNo,
        "ogpSrNo": ogpSrNo,
        "storeCode": storeCode,
        "itemCode": itemCode,
        "qty": qty,
        "colorCode": colorCode,
        "colorName": colorName,
        "packingID": packingID,
      };
      debugPrint(jsonEncode(body));
      final response = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": user.logindata.beareartoken,
        },
        body: jsonEncode(body),
      );
      debugPrint("status code == ${response.statusCode}");
      debugPrint("status code == ${response.body}");
      if (response.statusCode == 200) {
        ReturnModel check = ReturnModel.fromJson(jsonDecode(response.body));
        debugPrint("status Data Saved == ${jsonDecode(response.body)}");
        if (check.status) {
          setLoading(false);
          Utils.showCustomSnackbar(
            context: context,
            title: "Success",
            message: "Data Saved successfully",
            backgroundColor: Colors.grey,
          );
          Navigator.popUntil(context, (route) => route.isFirst);
          return null;
        } else {
          setLoading(false);
          Utils.showCustomSnackbar(
            context: context,
            title: "Failed",
            message: check.message,
            backgroundColor: Colors.grey,
          );
        }

        notifyListeners();
      } else {
        setLoading(false);
      }
    } catch (error) {
      Utils.showCustomSnackbar(
        context: context,
        title: "Failed",
        message: error.toString(),
        backgroundColor: Colors.grey,
      );
      print("error : $error");
      setLoading(false);
    }
    Navigator.pop(context);
    return null;
  }
}
