import 'package:flutter/material.dart';

class SocialIconButton extends StatelessWidget {
  final String iconPath;

  const SocialIconButton({required this.iconPath, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: () {
        // Handle social sign-in
      },
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFF9F9F9),
          border: Border.all(color: Color(0xFFF9F9F9)),
        ),
        child: Image.asset(
          iconPath, // Replace with your asset path
          height: 24,
          width: 24,
        ),
      ),
    );
  }
}
