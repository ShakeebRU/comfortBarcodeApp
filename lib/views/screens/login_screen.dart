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
  final _formKey = GlobalKey<FormState>();
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
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.only(left: 10.0),
                      //       child: Text(
                      //         "Forget Password",
                      //         textAlign: TextAlign.left,
                      //         style: TextStyle(
                      //           fontSize: 15,
                      //           color: Colors.black,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(height: 20),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text(
                      //       'Employee',
                      //       style: TextStyle(
                      //         fontSize: 16,
                      //         color: isErp ? Colors.black : Colors.black,
                      //         fontWeight: !isErp
                      //             ? FontWeight.bold
                      //             : FontWeight.normal,
                      //       ),
                      //     ),
                      //     Switch(
                      //       value: isErp,
                      //       activeColor: Colors.black,
                      //       onChanged: (value) {
                      //         setState(() {
                      //           isErp = value;
                      //         });
                      //         // You can use isErp here as true/false
                      //         print('isErp: $isErp');
                      //       },
                      //     ),
                      //     Text(
                      //       'Purchaser',
                      //       style: TextStyle(
                      //         fontSize: 16,
                      //         color: isErp ? Colors.black : Colors.black,
                      //         fontWeight: isErp
                      //             ? FontWeight.bold
                      //             : FontWeight.normal,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(height: 20),
                      // Spacer(),
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
                            await controller.login(
                              context,
                              emailController.text,
                              passwordController.text,
                              // isErp,
                            );
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
