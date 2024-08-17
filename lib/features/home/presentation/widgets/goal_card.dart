import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/text_font_style.dart';
import '../../../../core/helpers/ui_helpers.dart';
import '../../../../gen/colors.gen.dart';

class GoalCard extends StatelessWidget {
  final String title;
  final String dateTime;
  final String duration;

  const GoalCard({
    super.key,
    required this.title,
    required this.dateTime,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(14.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextFontStyle.headline14MediumMontserrat.copyWith(
                  color: AppColors.c1E293B,
                  letterSpacing: -0.08,
                ),
              ),
              UIHelper.verticalSpace6,
              Text(
                dateTime,
                style: TextFontStyle.headline12RegularMontserrat.copyWith(
                  color: AppColors.c475569,
                  letterSpacing: -0.07,
                ),
              ),
            ],
          ),
          Text(
            duration,
            style: TextFontStyle.headline12MediumMontserrat.copyWith(
              color: AppColors.cF97316,
              letterSpacing: -0.07,
            ),
          ),
        ],
      ),
    );
  }
}

