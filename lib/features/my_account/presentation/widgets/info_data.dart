
import 'package:flutter/material.dart';
import '../../../../core/constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';

class InfoData extends StatelessWidget {
  final String prefix;
  final String postfix;
  const InfoData({
    super.key,
    required this.prefix,
    required this.postfix,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: prefix, style: TextFontStyle.headline14MediumMontserrat),
          TextSpan(
              text: postfix,
              style: TextFontStyle.headline12RegularMontserrat
                  .copyWith(color: AppColors.c110C11)),
        ],
      ),
    );
  }
}
