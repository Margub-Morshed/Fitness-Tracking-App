import 'package:fitness_tracking_app/core/constants/text_font_style.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Splash",
          style: TextFontStyle.bodyBold14,
        ),
      ),
    );
  }
}
