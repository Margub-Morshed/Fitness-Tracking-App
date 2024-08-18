import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/text_font_style.dart';
import '../../../../core/helpers/ui_helpers.dart';
import '../../../../gen/colors.gen.dart';
import '../../../home/presentation/widgets/dot_divider.dart';

Widget buildExerciseInfoCard({
  required String imagePath,
  required String title,
  required String exercises,
  required String duration,
}) {
  return Container(
    padding: EdgeInsets.all(UIHelper.kDefaultPadding()),
    child: Row(
      children: [
        // Exercise Image
        Image.asset(imagePath, height: 32.h, width: 64.w),
        UIHelper.horizontalSpace(16.w),

        // Exercise Details
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Exercise Title
            Text(
              title,
              style: TextFontStyle.headline16SemiBoldMontserrat,
            ),
            UIHelper.verticalSpace4,

            // Exercise Meta Information
            Row(
              children: [
                Text(
                  exercises,
                  style: TextFontStyle.headline14RegularMontserrat
                      .copyWith(color: AppColors.c494949),
                ),

                // Dot Divider
                UIHelper.horizontalSpace6,
                const DotDivider(),
                UIHelper.horizontalSpace6,

                Text(
                  duration,
                  style: TextFontStyle.headline14RegularMontserrat.copyWith(
                    color: AppColors.c494949,
                  ),
                ),
              ],
            ),
          ],
        ),

        // Arrow Icon
        const Spacer(),
        Icon(Icons.arrow_forward_ios, size: 24.sp, color: AppColors.cF97316),
      ],
    ),
  );
}
