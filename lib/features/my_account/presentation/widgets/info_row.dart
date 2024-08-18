
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/text_font_style.dart';
import '../../../../core/helpers/ui_helpers.dart';
import '../../../../gen/colors.gen.dart';
import 'label_count_tspan.dart';

class InfoRow extends StatelessWidget {
  final String iconPath;
  final String title;
  final String count;
  final String unit;
  final String duration;

  const InfoRow({
    super.key,
    required this.iconPath,
    required this.title,
    required this.count,
    required this.unit,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left Portion
        Row(
          children: [
            SvgPicture.asset(iconPath, height: 24.h, width: 24.w),
            UIHelper.horizontalSpace(8.w),
            Text(
              title,
              style: TextFontStyle.headline14MediumMontserrat,
            ),
          ],
        ),

        // Right Portion
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            LabelCountTSpan(count: count, label: unit),
            UIHelper.verticalSpace4,
            Text(
              duration,
              style: TextFontStyle.headline14MediumMontserrat
                  .copyWith(color: AppColors.c494949),
            ),
          ],
        ),
      ],
    );
  }
}
