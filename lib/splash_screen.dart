import 'package:fitness_tracking_app/core/helpers/ui_helpers.dart';
import 'package:fitness_tracking_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(UIHelper.kDefaultPadding()),
          child: Image.asset(Assets.images.logo512.path)),
    );
  }
}
