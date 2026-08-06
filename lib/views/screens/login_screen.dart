import 'package:comfortbarcode/Utils/preferences.dart';
import 'package:comfortbarcode/constants/apilinks.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../Components/input_field_widget.dart';
import '../../constants/constants.dart';
import '../../Controllers/auth_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool visibility = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController wanController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    handleServerAddress();
  }

  void handleServerAddress() async {
    String? baseUrl = await Preferences.init().then(
      (onValue) => onValue.getInternetAddress(),
    );
    if (baseUrl != null && baseUrl.isNotEmpty) {
      wanController.text = baseUrl;
    } else {
      String? baseUrl = await Preferences.init().then(
        (onValue) => onValue.getAppUrl(),
      );
      wanController.text = baseUrl ?? "";
    }
  }

  final _formKey = GlobalKey<FormState>();

  void _showNetworkInputDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter Network Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: wanController,
                decoration: InputDecoration(hintText: 'Enter Internet Address'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                // if (wanController.text.isNotEmpty) {
                //   final controller = Provider.of<AuthController>(
                //     context,
                //     listen: false,
                //   );
                //   await controller.login(
                //     context,
                //     emailController.text,
                //     passwordController.text,
                //     wanController.text,
                //     // isErp,
                //   );
                // }
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // bool isErp = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Consumer<AuthController>(
      builder: (context, controller, child) {
        return Scaffold(
          backgroundColor: Constants.secondaryColor,
          body: Form(
            key: _formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  height: 420,
                  width: width * 0.9,
                  padding: EdgeInsets.all(20),
                  color: Constants.secondaryColor2.withOpacity(0.5),
                  child: Column(
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontFamily: GoogleFonts.sedgwickAve().fontFamily,
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          _showNetworkInputDialog(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.online_prediction),
                            SizedBox(width: 10),
                            Text(
                              "Change Sever Address",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      CustomInputField(
                        label: "Username",
                        hint: "Enter username",
                        isDark: true,
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter username";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      CustomInputField(
                        label: "Password",
                        hint: "Enter password",
                        isDark: true,
                        isPassword: visibility ? false : true,
                        sufixWidget: visibility
                            ? GestureDetector(
                                onTap: () => setState(() {
                                  visibility = !visibility;
                                }),
                                child: Icon(Icons.visibility),
                              )
                            : GestureDetector(
                                onTap: () => setState(() {
                                  visibility = !visibility;
                                }),
                                child: Icon(Icons.visibility_off),
                              ),
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter password";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),

                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.black),
                          shape: const WidgetStatePropertyAll(
                            ContinuousRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                          fixedSize: WidgetStatePropertyAll(
                            Size(width * 0.7, 50),
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            // print("is erp 1 : ${isErp}");
                            if (wanController.text.isNotEmpty) {
                              final controller = Provider.of<AuthController>(
                                context,
                                listen: false,
                              );
                              await controller.login(
                                context,
                                emailController.text,
                                passwordController.text,
                                wanController.text,
                                // isErp,
                              );
                            }
                          }
                        },
                        child: controller.isLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: Constants.primaryColor,
                                ),
                              )
                            : Text(
                                "Login",
                                style: GoogleFonts.urbanist(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
