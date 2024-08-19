import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../../core/constants/text_font_style.dart';
import '../../../../core/helpers/ui_helpers.dart';
import '../../../../gen/colors.gen.dart';

class ProgressBar extends StatelessWidget {
  final double percentage;
  final String progressLabel;
  final String label;
  final String time;

  const ProgressBar({
    super.key,
    required this.percentage,
    required this.progressLabel,
    required this.label,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main Content
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 22.h),
          child: Column(
            children: [
              CircularPercentIndicator(
                backgroundWidth: 10.w, // Outside Width
                lineWidth: 10.sp, // Inside Width
                percent: percentage, // Completion Percentage
                startAngle: 180,
                radius: 45.r, // Size
                circularStrokeCap: CircularStrokeCap.round, // Inside Curve
                backgroundColor: AppColors.cFFFFFF, // Outside Fill Color
                progressColor: AppColors.cF97316, // Inside Fill Color
                animateFromLastPercent: true,
                animation: true,
                animationDuration: 1000, // Animation Time Duration
                center: Text(
                  progressLabel,
                  style: TextFontStyle.headline14SemiBoldMontserrat
                      .copyWith(color: AppColors.cF97316),
                ),
              ),
              UIHelper.verticalSpace(14.h),
              Text(
                label,
                style: TextFontStyle.headline14BoldMontserrat,
              ),
              UIHelper.verticalSpace4,
              Text('$time min remaining',
                  style: TextFontStyle.headline12RegularMontserrat
                      .copyWith(color: AppColors.c494949))
            ],
          ),
        ),

        // Dotted Option
        Positioned(
          top: 0,
          right: 0,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 22.h),
              child: GestureDetector(
                  onTap: () {},
                  child:
                      const Icon(Icons.more_vert, color: AppColors.c667085))),
        ),
      ],
    );
  }
}
