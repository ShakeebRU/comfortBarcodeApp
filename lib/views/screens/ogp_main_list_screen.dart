import 'package:comfortbarcode/Controllers/setup_controller.dart';
import 'package:comfortbarcode/Utils/utils.dart';
import 'package:comfortbarcode/views/screens/ogp_detail_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/ogp_main_list_response_model.dart';

class OgpMainListScreen extends StatelessWidget {
  final List<OgpMainModel> response;

  const OgpMainListScreen({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("OGP List"),
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
              final apiResponseModel = await cont.getOgpDetailList(
                context,
                item.branchCode,
                item.formNo,
              );
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => OgpDetailScreen(response: apiResponseModel),
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
                  /// Form No
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Form No: ${item.formNo}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          item.status,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  /// Party
                  Text(
                    "Party: ${item.partyName}",
                    style: const TextStyle(fontSize: 14),
                  ),

                  const SizedBox(height: 4),

                  /// Vehicle
                  Text(
                    "Vehicle: ${item.vehicleNo}",
                    style: const TextStyle(fontSize: 14),
                  ),

                  const SizedBox(height: 4),

                  /// Driver
                  Text(
                    "Driver: ${item.driverName} (${item.driverContactNo})",
                    style: const TextStyle(fontSize: 14),
                  ),

                  const SizedBox(height: 4),

                  /// Date
                  Text(
                    "Date: ${item.transactionDate}",
                    style: const TextStyle(fontSize: 14),
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
