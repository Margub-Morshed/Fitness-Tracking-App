import 'package:flutter/material.dart';
import '../../../../core/constants/text_font_style.dart';
import '../../../../core/helpers/helper_methods.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            showExitConfirmationDialog(context);
          },
          child: Text(
            "Home",
            style: TextFontStyle.bodyBold14,
          ),
        ),
      ),
    );
  }
}
