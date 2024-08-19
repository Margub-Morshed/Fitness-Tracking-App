import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/text_font_style.dart';
import '../../../../core/helpers/ui_helpers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';

class ProgressCard extends StatelessWidget {
  final String title;
  final String progressPercentage;
  final double progressWidth;
  final String caloriesBurned;
  final String caloriesGoal;

  const ProgressCard({
    super.key,
    required this.title,
    required this.progressPercentage,
    required this.progressWidth,
    required this.caloriesBurned,
    required this.caloriesGoal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 16.sp),

      // Inner shel decoration
      decoration: ShapeDecoration(
        color: AppColors.cFFFFFF,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),

        // Outer shell border
        shadows: [
          BoxShadow(
            color: AppColors.cD0D5DD,
            blurRadius: 2.sp,
            offset: const Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // In progress with percentage count with right arrow
          _buildHeader(),
          UIHelper.verticalSpace(14.h),

          // Red progress bar with percentage
          _buildProgressBar(),
          UIHelper.verticalSpace(16.h),

          // You've burned...
          _buildFooter(),
        ],
      ),
    );
  }

  Row _buildFooter() {
    return Row(
      children: [
        Text(
          'You’ve burned ',
          style: TextFontStyle.headline12MediumMontserrat
              .copyWith(color: AppColors.c494949),
        ),
        SvgPicture.asset(
          Assets.icons.calories,
          height: 20.h,
          width: 20.w,
        ),
        Text(
          caloriesBurned,
          style: TextFontStyle.headline16SemiBoldMontserrat,
        ),
        Text(
          ' out of $caloriesGoal cal.',
          style: TextFontStyle.headline12MediumMontserrat
              .copyWith(color: AppColors.c494949),
        ),
      ],
    );
  }

  Container _buildProgressBar() {
    return Container(
      height: 6.h,
      decoration: BoxDecoration(
        color: AppColors.c686868,
        borderRadius: BorderRadius.circular(3.r),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: progressWidth,
          height: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.cDC4040,
            borderRadius: BorderRadius.circular(3.r),
          ),
        ),
      ),
    );
  }

  Row _buildHeader() {
    return Row(
      children: [
        Text(
          title,
          style: TextFontStyle.headline16MediumMontserrat
              .copyWith(color: AppColors.c494949),
        ),
        UIHelper.horizontalSpace(12.w),
        Text(
          progressPercentage,
          style: TextFontStyle.headline24MediumMontserrat,
        ),
        const Spacer(),
        SvgPicture.asset(
          Assets.icons.rightArrow,
          height: 32.h,
          width: 32.w,
        ),
      ],
    );
  }
}
