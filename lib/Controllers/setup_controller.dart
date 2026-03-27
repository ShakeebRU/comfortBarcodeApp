import 'dart:convert' show jsonDecode;
import 'package:comfortbarcode/models/barcode_location_response_model.dart';
import 'package:comfortbarcode/models/ogp_detail_list_response_model.dart';
import 'package:comfortbarcode/models/ogp_detail_location_list_response_model.dart';
import 'package:comfortbarcode/models/ogp_main_list_response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Utils/preferences.dart';
import '../constants/apilinks.dart';

class SetupController with ChangeNotifier {
  List<OgpMainModel> ogpMainList = [];
  Future<List<OgpMainModel>> getOgpMainList(BuildContext context) async {
    String? baseUrl = await Preferences.init().then(
      (onValue) => onValue.getInternetAddress(),
    );
    ogpMainList = [];
    debugPrint(baseUrl! + ApiLinks.getogpmainlist);
    Uri uri = Uri.parse(baseUrl! + ApiLinks.getogpmainlist);
    try {
      http.Response response = await http.get(uri);
      debugPrint("status code == ${response.statusCode}");
      if (response.statusCode == 200) {
        OgpMainListResponseModel responseData =
            OgpMainListResponseModel.fromJson(jsonDecode(response.body));
        ogpMainList = responseData.listdata;
        print(ogpMainList.length);
        notifyListeners();
      }
    } catch (error) {
      print("error : $error");
    }
    return ogpMainList;
  }

  List<OgpDetailModel> ogpDetailModelList = [];
  Future<List<OgpDetailModel>> getOgpDetailList(
    BuildContext context,
    dynamic branchCode,
    dynamic formNo,
  ) async {
    String? baseUrl = await Preferences.init().then(
      (onValue) => onValue.getInternetAddress(),
    );
    ogpDetailModelList = [];
    String url =
        "${baseUrl! + ApiLinks.getogpdetaillist}?branchcode=$branchCode&formno=$formNo";
    debugPrint(url);
    Uri uri = Uri.parse(url);
    try {
      http.Response response = await http.get(uri);
      debugPrint("status code == ${response.statusCode}");
      if (response.statusCode == 200) {
        OgpDetailListResponseModel responseData =
            OgpDetailListResponseModel.fromJson(jsonDecode(response.body));
        ogpDetailModelList = responseData.listdata;
        print(ogpDetailModelList.length);
        notifyListeners();
      }
    } catch (error) {
      print("error : $error");
    }
    return ogpDetailModelList;
  }

  Future<BarcodeLocationResponseModel?> getOgpDetailListByBarcode(
    BuildContext context,
    String barcode,
    String itemCode,
  ) async {
    String? baseUrl = await Preferences.init().then(
      (onValue) => onValue.getInternetAddress(),
    );
    try {
      final response = await http.get(
        Uri.parse(
          "${baseUrl! + ApiLinks.getbarcodedetail}?barcode=$barcode&itemcode=$itemCode",
        ),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        BarcodeLocationResponseModel responseData =
            BarcodeLocationResponseModel.fromJson(jsonDecode(response.body));
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("API Response Received")));
        print(data);
        return responseData;
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("API Error")));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  OgpDetailDataModel? ogpLocationListData;
  Future<OgpDetailDataModel?> getOgpDetailSingle(
    BuildContext context,
    String branchcode,
    String formno,
    String srNo,
  ) async {
    String? baseUrl = await Preferences.init().then(
      (onValue) => onValue.getInternetAddress(),
    );
    try {
      final response = await http.get(
        Uri.parse(
          "${baseUrl! + ApiLinks.getogpdetailsingle}?branchcode=$branchcode&formno=$formno&srno=$srNo",
        ),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        OgpDetailLocationListResponseModel responseData =
            OgpDetailLocationListResponseModel.fromJson(
              jsonDecode(response.body),
            );
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("API Response Received")));
        print(data);
        ogpLocationListData = responseData.formdata;
        notifyListeners();
        return responseData.formdata;
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("API Error")));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }
}
