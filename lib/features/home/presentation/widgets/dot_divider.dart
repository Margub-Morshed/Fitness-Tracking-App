
import 'package:flutter/material.dart';
import '../../../../gen/colors.gen.dart';

class DotDivider extends StatelessWidget {
  const DotDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      height: 2,
      decoration: const ShapeDecoration(
        color: AppColors.c110C11,
        shape: CircleBorder(),
      ),
    );
  }
}
