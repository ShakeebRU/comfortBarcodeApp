import 'dart:convert' show jsonDecode;
import 'package:comfortbarcode/models/barcode_location_response_model.dart';
import 'package:comfortbarcode/models/ogp_detail_list_response_model.dart';
import 'package:comfortbarcode/models/ogp_main_list_response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../constants/apilinks.dart';

class SetupController with ChangeNotifier {
  List<OgpMainModel> ogpMainList = [];
  Future<List<OgpMainModel>> getOgpMainList(BuildContext context) async {
    ogpMainList = [];
    debugPrint(ApiLinks.getogpmainlist);
    Uri uri = Uri.parse(ApiLinks.getogpmainlist);
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
    ogpDetailModelList = [];
    String url =
        "${ApiLinks.getogpdetaillist}?branchcode=$branchCode&formno=$formNo";
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
    // try {
    final response = await http.get(
      Uri.parse(
        "${ApiLinks.getbarcodedetail}?barcode=$barcode&itemcode=$itemCode",
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
    // } catch (e) {
    //   ScaffoldMessenger.of(
    //     context,
    //   ).showSnackBar(SnackBar(content: Text("Error: $e")));
    // }
  }
}
