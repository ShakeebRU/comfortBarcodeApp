import 'package:comfortbarcode/constants/constants.dart';
import 'package:comfortbarcode/models/ogp_detail_list_response_model.dart';
import 'package:comfortbarcode/views/screens/ogp_detail_entery_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controllers/setup_controller.dart' show SetupController;
import '../../Utils/utils.dart';

class OgpDetailScreen extends StatelessWidget {
  final List<OgpDetailModel> response;

  const OgpDetailScreen({super.key, required this.response});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Constants.secondaryColor,
        title: const Text("OGP Detail"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: response.length,
        itemBuilder: (context, index) {
          final item = response[index];

          return GestureDetector(
            onTap: () async {
              Utils.showLoadingDialog(context);
              final cont = Provider.of<SetupController>(context, listen: false);

              final apiResponseModel = await cont.getOgpDetailSingle(
                context,
                item.branchCode.toString(),
                item.formNo.toString(),
                item.srNo.toString(),
              );

              Navigator.pop(context);
              if (apiResponseModel == null) {
                Utils.showCustomSnackbar(
                  context: context,
                  title: "Error",
                  message: "No detail record found.",
                  backgroundColor: Colors.grey,
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return OgpDetailEntryScreen(response: apiResponseModel!);
                    },
                  ),
                );
              }
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.2),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Item Code + SR
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${item.itemDescription}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),
                  Text(
                    "${item.itemCode}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 4),

                  /// Quantity
                  Text(
                    "Qty: ${item.qty}",
                    style: const TextStyle(fontSize: 14),
                  ),

                  const SizedBox(height: 4),

                  /// Location
                  Text(
                    "Location: ${item.locationName}",
                    style: const TextStyle(fontSize: 14),
                  ),

                  const SizedBox(height: 4),

                  const Divider(height: 20),

                  /// Bags
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Scanned Bags: ${item.scannedBags}",
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        "Scanned Weight: ${item.scannedWeight}",
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
