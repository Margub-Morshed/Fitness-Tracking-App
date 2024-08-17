import 'package:flutter/material.dart';
import '../../../../core/constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String option;
  final VoidCallback? onTap;

  const SectionHeader(
      {super.key, this.onTap, required this.title, this.option = "See All"});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextFontStyle.headline20SemiBoldMontserrat),
        InkWell(
          onTap: onTap,
          child: Text(
            option,
            style: TextFontStyle.headline16MediumMontserrat.copyWith(
              color: AppColors.cF97316,
              letterSpacing: -0.08,
            ),
          ),
        ),
      ],
    );
  }
}
