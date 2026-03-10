import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Constants/constants.dart';

class CustomInputField extends StatefulWidget {
  final bool isDark;
  final String label;
  final String hint;
  final TextInputType? keyboardType;
  final bool isPassword;
  final bool enable;
  final Widget? sufixWidget;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;

  const CustomInputField({
    required this.isDark,
    required this.label,
    required this.hint,
    this.isPassword = false,
    this.enable = true,
    this.sufixWidget,
    this.keyboardType = TextInputType.text,
    required this.controller,
    required this.validator,
    this.onChanged,
    super.key,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Text(
            widget.label,
            style: GoogleFonts.outfit(
              fontSize: 15,
              color: widget.isDark ? Colors.black : Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 5.0),
        TextFormField(
          cursorColor: Colors.black,
          controller: widget.controller,
          obscureText: widget.isPassword,
          validator: widget.validator,
          // onChanged: (val) {
          //   if (widget.onChanged != null) {
          //     widget.onChanged!(val);
          //   }
          //   // setState(() {
          //   // if (val.isNotEmpty) {
          //   //   widget.controller.text = val;
          //   // }
          //   // });
          // },
          keyboardType: widget.keyboardType,
          enabled: widget.enable,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontFamily: Constants.onboardingTextFont,
          ),
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: TextStyle(
              color: const Color(0xFFC4C3C3),
              fontSize: 15,
              fontFamily: Constants.onboardingTextFont,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(20),
            suffixIcon: widget.sufixWidget,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                color: Color(0xFFD9D9D9),
                strokeAlign: 1,
                width: 1,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                color: Colors.red,
                strokeAlign: 1,
                width: 1,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                color: Color(0xFFD9D9D9),
                strokeAlign: 1,
                width: 1,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                color: Color(0xFFD9D9D9),
                strokeAlign: 1,
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
