// import 'dart:convert';
// import 'package:comfortbarcode/Controllers/functionality_controller.dart';
// import 'package:comfortbarcode/Controllers/setup_controller.dart';
// import 'package:comfortbarcode/models/ogp_detail_list_response_model.dart';
// import 'package:comfortbarcode/models/ogp_detail_location_list_response_model.dart';
// import 'package:comfortbarcode/views/screens/ogp_detail_entery_list_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';
// import '../../Utils/utils.dart';
// import '../../constants/constants.dart';
// import '../../models/barcode_location_response_model.dart';
// import 'ogp_detail_list_screen.dart';

// class BarcodeScannerScreen extends StatefulWidget {
//   final OgpDetailDataModel data;
//   final String itemCode;
//   const BarcodeScannerScreen({
//     super.key,
//     required this.itemCode,
//     required this.data,
//   });

//   @override
//   State<BarcodeScannerScreen> createState() => _BarcodeScannerScreenState();
// }

// class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
//   bool isScanning = true;

//   Future<void> handleScannedData(String barcode) async {
//     print(barcode);
//     print(widget.itemCode);
//     final cont = Provider.of<SetupController>(context, listen: false);
//     BarcodeLocationResponseModel? responseData = await cont
//         .getOgpDetailListByBarcode(
//           context,
//           barcode.toString(),
//           widget.itemCode,
//         );
//     print("check : ${responseData == null}");
//     if (responseData == null) {
//       return;
//     }
//     if (responseData.status) {
//       TextEditingController quantityController = TextEditingController();
//       showDialog(
//         context: context,
//         builder: (_) => AlertDialog(
//           title: const Text("Enter Quantity"),
//           content: TextFormField(
//             controller: quantityController,
//             keyboardType: TextInputType.number,
//             decoration: const InputDecoration(border: OutlineInputBorder()),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 setState(() {
//                   isScanning = true;
//                 });
//               },
//               child: const Text("cancel"),
//             ),
//             TextButton(
//               onPressed: () async {
//                 double qty = double.parse(
//                   quantityController.text == "" ? "0" : quantityController.text,
//                 );
//                 if (qty < widget.data.qty) {
//                   print("Quantity : ${quantityController.text}");
//                   final contFunt = Provider.of<FunctionalityController>(
//                     context,
//                     listen: false,
//                   );
//                   await contFunt.saveScannedData(
//                     context,
//                     branchCode: responseData.formdata.branchCode,
//                     ogpLocationID: int.parse(responseData.subdata.locationCode),
//                     locationCode: responseData.subdata.locationCode,
//                     ogpFormNo: widget.data.formNo,
//                     ogpSrNo: widget.data.srNo,
//                     storeCode: responseData.subdata.storeCode,
//                     itemCode: responseData.formdata.itemCode,
//                     qty: qty,
//                     colorCode: responseData.subdata.colorCode,
//                     colorName: responseData.subdata.colorName ?? "",
//                     packingID: responseData.formdata.packingID,
//                     barcode: barcode,
//                   );
//                   setState(() {
//                     isScanning = false;
//                   });
//                   Utils.showLoadingDialog(context);
//                   final cont = Provider.of<SetupController>(
//                     context,
//                     listen: false,
//                   );
//                   final apiResponseModel = await cont.getOgpDetailList(
//                     context,
//                     widget.data.branchCode,
//                     widget.data.formNo,
//                   );
//                   await cont.getOgpDetailSingle(
//                     context,
//                     widget.data.branchCode.toString(),
//                     widget.data.formNo.toString(),
//                     widget.data.srNo.toString(),
//                   );
//                   Navigator.pop(context);
//                   Navigator.pop(context);
//                   Navigator.pop(context);
//                   Navigator.pop(context);
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) =>
//                           OgpDetailEntryScreen(response: widget.data),
//                     ),
//                   );
//                 } else {
//                   Utils.showCustomSnackbar(
//                     context: context,
//                     title: "Error",
//                     message: "Enter value is greater then required quantity.",
//                     backgroundColor: Colors.grey,
//                   );
//                 }
//               },
//               child: const Text("Save"),
//             ),
//           ],
//         ),
//       );
//     } else {
//       print(responseData != null && responseData.status);
//       setState(() {
//         isScanning = true;
//       });
//     }
//     // return isScanning;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: true,
//         backgroundColor: Constants.secondaryColor,
//         title: const Text("Scan Barcode"),
//       ),
//       body: Stack(
//         children: [
//           /// Camera Scanner
//           MobileScanner(
//             controller: MobileScannerController(
//               detectionSpeed: DetectionSpeed.noDuplicates,
//             ),

//             onDetect: (barcodeCapture) async {
//               if (!isScanning) return;

//               final List<Barcode> barcodes = barcodeCapture.barcodes;

//               for (final barcode in barcodes) {
//                 final String? code = barcode.rawValue;

//                 if (code != null) {
//                   isScanning = false;
//                   // bool check =
//                   await handleScannedData(code);
//                   // if (check) {
//                   //   break;
//                   // }
//                 }
//               }
//             },
//           ),

//           /// Scan overlay
//           Center(
//             child: Container(
//               width: 250,
//               height: 250,
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.red, width: 3),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'package:comfortbarcode/Controllers/functionality_controller.dart';
import 'package:comfortbarcode/Controllers/setup_controller.dart';
import 'package:comfortbarcode/models/ogp_detail_list_response_model.dart';
import 'package:comfortbarcode/models/ogp_detail_location_list_response_model.dart';
import 'package:comfortbarcode/views/screens/ogp_detail_entery_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import '../../Utils/utils.dart';
import '../../constants/constants.dart';
import '../../models/barcode_location_response_model.dart';

class BarcodeScannerScreen extends StatefulWidget {
  final OgpDetailDataModel data;
  final String itemCode;

  const BarcodeScannerScreen({
    super.key,
    required this.itemCode,
    required this.data,
  });

  @override
  State<BarcodeScannerScreen> createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  bool isScanning = true;
  bool isScannerMode = false;

  final TextEditingController manualController = TextEditingController();
  final FocusNode manualFocusNode = FocusNode();

  Future<void> handleScannedData(String barcode) async {
    print(barcode);
    print(widget.itemCode);

    final cont = Provider.of<SetupController>(context, listen: false);

    BarcodeLocationResponseModel? responseData = await cont
        .getOgpDetailListByBarcode(
          context,
          barcode.toString(),
          widget.itemCode,
        );

    if (responseData == null) {
      setState(() => isScanning = true);
      return;
    }

    if (responseData.status) {
      TextEditingController quantityController = TextEditingController();

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Enter Quantity"),
          content: TextFormField(
            controller: quantityController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Future.delayed(const Duration(milliseconds: 200), () {
                  FocusScope.of(context).requestFocus(manualFocusNode);
                });
                setState(() => isScanning = true);
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                double qty = double.parse(
                  quantityController.text.isEmpty
                      ? "0"
                      : quantityController.text,
                );

                if (qty < widget.data.qty) {
                  final contFunt = Provider.of<FunctionalityController>(
                    context,
                    listen: false,
                  );

                  await contFunt.saveScannedData(
                    context,
                    branchCode: responseData.formdata.branchCode,
                    ogpLocationID: int.parse(responseData.subdata.locationCode),
                    locationCode: responseData.subdata.locationCode,
                    ogpFormNo: widget.data.formNo,
                    ogpSrNo: widget.data.srNo,
                    storeCode: responseData.subdata.storeCode,
                    itemCode: responseData.formdata.itemCode,
                    qty: qty,
                    colorCode: responseData.subdata.colorCode,
                    colorName: responseData.subdata.colorName ?? "",
                    packingID: responseData.formdata.packingID,
                    barcode: barcode,
                  );

                  setState(() => isScanning = false);

                  Utils.showLoadingDialog(context);

                  final cont = Provider.of<SetupController>(
                    context,
                    listen: false,
                  );

                  await cont.getOgpDetailList(
                    context,
                    widget.data.branchCode,
                    widget.data.formNo,
                  );

                  await cont.getOgpDetailSingle(
                    context,
                    widget.data.branchCode.toString(),
                    widget.data.formNo.toString(),
                    widget.data.srNo.toString(),
                  );

                  Navigator.pop(context); // loading
                  Navigator.pop(context); // dialog
                  Navigator.pop(context);
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          OgpDetailEntryScreen(response: widget.data),
                    ),
                  );
                } else {
                  Utils.showCustomSnackbar(
                    context: context,
                    title: "Error",
                    message: "Entered value is greater than required quantity.",
                    backgroundColor: Colors.grey,
                  );
                }
              },
              child: const Text("Save"),
            ),
          ],
        ),
      );
    } else {
      setState(() => isScanning = true);
    }
  }

  @override
  void dispose() {
    manualController.dispose();
    manualFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.secondaryColor,
        title: const Text("Scan Barcode"),
      ),
      body: Column(
        children: [
          /// 🔘 Radio Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Radio<bool>(
                    value: true,
                    groupValue: isScannerMode,
                    onChanged: (value) {
                      setState(() {
                        isScannerMode = value!;
                      });
                    },
                  ),
                  const Text("Camera"),
                ],
              ),
              Row(
                children: [
                  Radio<bool>(
                    value: false,
                    groupValue: isScannerMode,
                    onChanged: (value) {
                      setState(() {
                        isScannerMode = value!;
                      });

                      /// Auto focus
                      Future.delayed(const Duration(milliseconds: 300), () {
                        FocusScope.of(context).requestFocus(manualFocusNode);
                      });
                    },
                  ),
                  const Text("Scanner"),
                ],
              ),
            ],
          ),

          /// 📱 Body
          Expanded(
            child: isScannerMode
                ? Stack(
                    children: [
                      MobileScanner(
                        controller: MobileScannerController(
                          detectionSpeed: DetectionSpeed.noDuplicates,
                        ),
                        onDetect: (barcodeCapture) async {
                          if (!isScanning) return;

                          for (final barcode in barcodeCapture.barcodes) {
                            final code = barcode.rawValue;

                            if (code != null) {
                              isScanning = false;
                              await handleScannedData(code);
                            }
                          }
                        },
                      ),

                      /// Overlay
                      Center(
                        child: Container(
                          width: 250,
                          height: 250,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red, width: 3),
                          ),
                        ),
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: manualController,
                          focusNode: manualFocusNode,
                          autofocus: true,
                          decoration: const InputDecoration(
                            labelText: "Enter Barcode",
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) async {
                            if (value.trim().isNotEmpty) {
                              isScanning = false;
                              await handleScannedData(value.trim());
                              manualController.clear();
                            }
                          },
                        ),
                        // const SizedBox(height: 20),
                        // ElevatedButton(
                        //   onPressed: () async {
                        //     final value = manualController.text.trim();

                        //     if (value.isNotEmpty) {
                        //       isScanning = false;
                        //       await handleScannedData(value);
                        //       manualController.clear();

                        //       FocusScope.of(
                        //         context,
                        //       ).requestFocus(manualFocusNode);
                        //     }
                        //   },
                        //   child: const Text("Submit"),
                        // ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
