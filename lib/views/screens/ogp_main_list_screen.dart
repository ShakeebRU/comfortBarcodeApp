// import 'package:comfortbarcode/Controllers/setup_controller.dart';
// import 'package:comfortbarcode/Utils/utils.dart';
// import 'package:comfortbarcode/constants/constants.dart';
// import 'package:comfortbarcode/views/screens/ogp_detail_list_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../models/ogp_main_list_response_model.dart';

// class OgpMainListScreen extends StatelessWidget {
//   final List<OgpMainModel> response;

//   const OgpMainListScreen({super.key, required this.response});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: true,
//         backgroundColor: Constants.secondaryColor,
//         title: const Text("OGP List"),
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(12),
//         itemCount: response.length,
//         itemBuilder: (context, index) {
//           final item = response[index];

//           return GestureDetector(
//             onTap: () async {
//               Utils.showLoadingDialog(context);
//               final cont = Provider.of<SetupController>(context, listen: false);
//               final apiResponseModel = await cont.getOgpDetailList(
//                 context,
//                 item.branchCode,
//                 item.formNo,
//               );
//               Navigator.pop(context);
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => OgpDetailScreen(response: apiResponseModel),
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
//                 border: Border.all(color: Constants.secondaryColor),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   /// Form No
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Form No: ${item.formNo}",
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                       // Container(
//                       //   padding: const EdgeInsets.symmetric(
//                       //     horizontal: 10,
//                       //     vertical: 4,
//                       //   ),
//                       //   decoration: BoxDecoration(
//                       //     color: Colors.blue.shade50,
//                       //     borderRadius: BorderRadius.circular(20),
//                       //   ),
//                       //   child: Text(
//                       //     item.status,
//                       //     style: const TextStyle(
//                       //       color: Colors.blue,
//                       //       fontWeight: FontWeight.bold,
//                       //     ),
//                       //   ),
//                       // ),
//                     ],
//                   ),

//                   const SizedBox(height: 4),

//                   /// Party
//                   Text(
//                     "${item.partyName}",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Constants.secondaryColor,
//                     ),
//                   ),
//                   const SizedBox(height: 4),

//                   /// Date
//                   Text(
//                     "Date: ${Utils.formatDateString(item.transactionDate)}",
//                     style: const TextStyle(fontSize: 14),
//                   ),
//                   const SizedBox(height: 4),

//                   /// Vehicle
//                   Text(
//                     "Vehicle: ${item.vehicleNo}",
//                     style: const TextStyle(fontSize: 14),
//                   ),

//                   const SizedBox(height: 4),

//                   /// Driver
//                   Text(
//                     "Driver: ${item.driverName} (${item.driverContactNo})",
//                     style: const TextStyle(fontSize: 14),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'dart:async';

import 'package:comfortbarcode/Controllers/setup_controller.dart';
import 'package:comfortbarcode/Utils/utils.dart';
import 'package:comfortbarcode/constants/constants.dart';
import 'package:comfortbarcode/views/screens/ogp_detail_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/ogp_main_list_response_model.dart';

class OgpMainListScreen extends StatefulWidget {
  const OgpMainListScreen({super.key});

  @override
  State<OgpMainListScreen> createState() => _OgpMainListScreenState();
}

class _OgpMainListScreenState extends State<OgpMainListScreen> {
  List<OgpMainModel> list = [];
  bool isLoading = true;

  final TextEditingController partyController = TextEditingController();
  final TextEditingController formController = TextEditingController();

  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    fetchData(); // initial load
  }

  Future<void> fetchData() async {
    try {
      setState(() {
        isLoading = true;
      });

      final cont = Provider.of<SetupController>(context, listen: false);

      final data = await cont.getOgpMainList(
        context,
        partyController.text,
        formController.text.isEmpty ? null : int.parse(formController.text),
      );

      setState(() {
        list = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Utils.showToast("Failed to load data");
    }
  }

  /// 🔥 Debounce search
  void onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      fetchData();
    });
  }

  @override
  void dispose() {
    partyController.dispose();
    formController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OGP List"),
        backgroundColor: Constants.secondaryColor,
      ),
      body: Column(
        children: [
          /// 🔍 Search Fields
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                /// Party Name
                TextField(
                  controller: partyController,
                  onChanged: (_) => onSearchChanged(),
                  decoration: InputDecoration(
                    hintText: "Search by Party Name",
                    prefixIcon: const Icon(Icons.person),
                    suffixIcon: partyController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              partyController.clear();
                              fetchData();
                              setState(() {});
                            },
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                /// Form No
                TextField(
                  controller: formController,
                  keyboardType: TextInputType.number,
                  onChanged: (_) => onSearchChanged(),
                  decoration: InputDecoration(
                    hintText: "Search by Form No",
                    prefixIcon: const Icon(Icons.confirmation_number),
                    suffixIcon: formController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              formController.clear();
                              fetchData();
                              setState(() {});
                            },
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// 📦 List / Loader
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : list.isEmpty
                ? const Center(child: Text("No data found"))
                : RefreshIndicator(
                    onRefresh: fetchData,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        final item = list[index];

                        return GestureDetector(
                          onTap: () async {
                            Utils.showLoadingDialog(context);

                            final cont = Provider.of<SetupController>(
                              context,
                              listen: false,
                            );

                            final apiResponseModel = await cont
                                .getOgpDetailList(
                                  context,
                                  item.branchCode,
                                  item.formNo,
                                );

                            Navigator.pop(context);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    OgpDetailScreen(response: apiResponseModel),
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
                              border: Border.all(
                                color: Constants.secondaryColor,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// Form No
                                Text(
                                  "Form No: ${item.formNo}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),

                                const SizedBox(height: 6),

                                /// Party Name
                                Text(
                                  item.partyName,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Constants.secondaryColor,
                                  ),
                                ),

                                const SizedBox(height: 6),

                                /// Date
                                Text(
                                  "Date: ${Utils.formatDateString(item.transactionDate)}",
                                ),

                                /// Vehicle
                                Text("Vehicle: ${item.vehicleNo}"),

                                /// Driver
                                Text(
                                  "Driver: ${item.driverName} (${item.driverContactNo})",
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
