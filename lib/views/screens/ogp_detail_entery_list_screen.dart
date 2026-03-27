// import 'package:comfortbarcode/constants/constants.dart';
// import 'package:comfortbarcode/models/ogp_detail_list_response_model.dart';
// import 'package:comfortbarcode/views/screens/scaning_barcode_screen.dart';
// import 'package:flutter/material.dart';

// class OgpDetailEntryScreen extends StatelessWidget {
//   final OgpDetailModel response;

//   const OgpDetailEntryScreen({super.key, required this.response});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: true,
//         backgroundColor: Constants.secondaryColor,
//         title: const Text("OGP Entry Detail"),
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(12),
//         itemCount: 1,
//         itemBuilder: (context, index) {
//           final item = response;

//           return GestureDetector(
//             onTap: () {
//               print(item.srNo);
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) {
//                     return BarcodeScannerScreen(
//                       itemCode: item.itemCode,
//                       data: item,
//                     );
//                   },
//                 ),
//               );
//             },
//             child: Container(
//               margin: const EdgeInsets.only(bottom: 12),
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(.2),
//                     blurRadius: 5,
//                     offset: const Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   /// Item Code + SR
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "${item.itemDescription}",
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 8),
//                   Text(
//                     "${item.itemCode}",
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),

//                   const SizedBox(height: 4),

//                   /// Quantity
//                   Text(
//                     "Qty: ${item.qty}",
//                     style: const TextStyle(fontSize: 14),
//                   ),

//                   const SizedBox(height: 4),

//                   /// Location
//                   Text(
//                     "Location: ${item.locationName}",
//                     style: const TextStyle(fontSize: 14),
//                   ),

//                   const SizedBox(height: 4),

//                   const Divider(height: 20),

//                   /// Bags
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Scanned Bags: ${item.scannedBags}",
//                         style: const TextStyle(fontSize: 14),
//                       ),
//                       Text(
//                         "Scanned Weight: ${item.scannedWeight}",
//                         style: const TextStyle(fontSize: 14),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:comfortbarcode/constants/constants.dart';
import 'package:comfortbarcode/models/ogp_detail_list_response_model.dart';
import 'package:comfortbarcode/views/screens/scaning_barcode_screen.dart';
import 'package:flutter/material.dart';

import '../../models/ogp_detail_location_list_response_model.dart';

class OgpDetailEntryScreen extends StatelessWidget {
  final OgpDetailDataModel response;

  const OgpDetailEntryScreen({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Constants.secondaryColor,
        title: const Text("OGP Entry Detail"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BarcodeScannerScreen(
                    itemCode: response.itemCode,
                    data: response,
                  ),
                ),
              );
            },
            child: Container(
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
                  /// Item Info
                  Text(
                    response.itemDescription,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    response.itemCode,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("SR No: ${response.srNo}"),
                      Text("Qty: ${response.qty}"),
                    ],
                  ),

                  const Divider(height: 20),

                  /// Bags + Weight
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Bags: ${response.bags}"),
                      Text("Scanned Bags: ${response.scannedBags}"),
                    ],
                  ),

                  const SizedBox(height: 6),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Net Weight: ${response.netWeight}"),
                      Text("Scanned Weight: ${response.scannedWeight}"),
                    ],
                  ),

                  const Divider(height: 20),

                  /// 🔥 Locations List
                  const Text(
                    "Locations",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),

                  const SizedBox(height: 8),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: response.ogpLocationList.length,
                    itemBuilder: (context, index) {
                      final loc = response.ogpLocationList[index];

                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// Location Code
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  loc.locationCode,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text("Qty: ${loc.qty}"),
                              ],
                            ),

                            /// Color
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  loc.colorName,
                                  style: const TextStyle(fontSize: 12),
                                ),
                                const SizedBox(height: 4),
                                Text("Color Code: ${loc.colorCode}"),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
