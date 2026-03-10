import 'package:comfortbarcode/Controllers/setup_controller.dart';
import 'package:comfortbarcode/Utils/preferences.dart';
import 'package:comfortbarcode/constants/constants.dart';
import 'package:comfortbarcode/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ogp_main_list_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.secondaryColor,
          centerTitle: true,
          title: Text("Home", style: TextStyle(color: Colors.white)),
          actions: [
            IconButton(
              onPressed: () async {
                await Preferences.init().then(
                  (onValue) => onValue.deleteUser(),
                );
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => DashboardScreen()),
                  (route) => false, // removes all previous routes
                );
              },
              icon: Icon(Icons.logout, color: Colors.white),
            ),
          ],
        ),
        body: Column(
          children: [
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: 1,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () async {
                    Utils.showLoadingDialog(context);
                    final cont = Provider.of<SetupController>(
                      context,
                      listen: false,
                    );
                    final apiResponseModel = await cont.getOgpMainList(context);
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            OgpMainListScreen(response: apiResponseModel),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Constants.secondaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: Center(
                        child: Text(
                          "Show Data",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
