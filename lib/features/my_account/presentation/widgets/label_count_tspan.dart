import 'package:flutter/material.dart';
import '../../../../core/constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';

class LabelCountTSpan extends StatelessWidget {
  const LabelCountTSpan({
    super.key,
    required this.count,
    required this.label,
  });

  final String count;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: count,
            style: TextFontStyle.headline16MediumMontserrat,
          ),
          TextSpan(
            text: ' $label',
            style: TextFontStyle.headline12RegularMontserrat
                .copyWith(color: AppColors.c494949),
          ),
        ],
      ),
    );
  }
}
