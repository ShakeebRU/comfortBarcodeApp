import 'package:comfortbarcode/models/ogp_detail_list_response_model.dart';
import 'package:comfortbarcode/views/screens/scaning_barcode_screen.dart';
import 'package:flutter/material.dart';

class OgpDetailScreen extends StatelessWidget {
  final List<OgpDetailModel> response;

  const OgpDetailScreen({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("OGP Detail"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: response.length,
        itemBuilder: (context, index) {
          final item = response[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return BarcodeScannerScreen(
                      itemCode: item.itemCode,
                      data: item,
                    );
                  },
                ),
              );
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
                        "Item: ${item.itemCode}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "SR: ${item.srNo}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  /// Quantity
                  Text(
                    "Qty: ${item.qty ?? 0}",
                    style: const TextStyle(fontSize: 14),
                  ),

                  const SizedBox(height: 4),

                  /// Location
                  Text(
                    "Location: ${item.locationName}",
                    style: const TextStyle(fontSize: 14),
                  ),

                  const SizedBox(height: 4),

                  /// Bags
                  Text(
                    "Bags: ${item.bags ?? 0}",
                    style: const TextStyle(fontSize: 14),
                  ),

                  const Divider(height: 20),

                  /// Weights
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Gross: ${item.grossWeight}"),
                      Text("Net: ${item.netWeight}"),
                      Text("Actual: ${item.actualWeight}"),
                    ],
                  ),

                  const SizedBox(height: 8),

                  /// Purpose
                  Text(
                    "Purpose: ${item.purposeID}",
                    style: const TextStyle(fontSize: 14),
                  ),

                  const SizedBox(height: 8),

                  /// GRN Status
                  Row(
                    children: [
                      const Text("Added to GRN: "),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: item.isAddedToGRN
                              ? Colors.green.shade100
                              : Colors.red.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          item.isAddedToGRN ? "YES" : "NO",
                          style: TextStyle(
                            color: item.isAddedToGRN
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
