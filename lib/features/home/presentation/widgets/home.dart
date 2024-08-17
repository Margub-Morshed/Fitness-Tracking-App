import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/text_font_style.dart';
import '../../../../core/helpers/ui_helpers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../data/models/daily_activity.dart';
import 'dot_divider.dart';
import 'notification_button.dart';

Widget buildHeaderRow(DailyActivityModel activity) {
  return Row(
    children: [
      Text(
        activity.dateTime,
        style: TextFontStyle.headline12RegularMontserrat.copyWith(
          color: AppColors.c494949,
        ),
      ),
      UIHelper.horizontalSpace6,
      const DotDivider(),
      UIHelper.horizontalSpace6,
      buildCaloriesInfo(activity),
    ],
  );
}

Widget buildCaloriesInfo(DailyActivityModel activity) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      SvgPicture.asset(
        Assets.icons.calories,
        height: 16.h,
        width: 16.w,
      ),
      Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '${activity.calories} ',
              style: TextFontStyle.headline12MediumMontserrat,
            ),
            TextSpan(
              text: 'cal',
              style: TextFontStyle.headline10RegularMontserrat.copyWith(
                color: AppColors.c494949,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget buildActivityRow(DailyActivityModel activity) {
  return Row(
    children: [
      CircleAvatar(
        radius: 36.sp,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(activity.imagePath),
      ),
      UIHelper.horizontalSpace(12.w),
      buildActivityDetails(activity),
    ],
  );
}

Widget buildActivityDetails(DailyActivityModel activity) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buildAchievementText(activity),
      UIHelper.verticalSpace4,
      Text(
        activity.activity,
        style: TextFontStyle.headline14MediumMontserrat.copyWith(
          color: AppColors.c494949,
        ),
      ),
    ],
  );
}

Widget buildAchievementText(DailyActivityModel activity) {
  return SizedBox(
    width: 130.w,
    child: Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '${activity.achievement}/',
            style: TextFontStyle.headline20SemiBoldMontserrat,
          ),
          TextSpan(
            text: activity.target,
            style: TextFontStyle.headline16MediumMontserrat.copyWith(
              color: AppColors.c494949,
            ),
          ),
        ],
      ),
      overflow: TextOverflow.ellipsis,
    ),
  );
}

Widget buildStatusIcon(DailyActivityModel activity) {
  return Align(
    alignment: Alignment.centerRight,
    child: SvgPicture.asset(
      activity.isAchieved ? Assets.icons.tick : Assets.icons.pause,
      height: 28.h,
      width: 28.w,
    ),
  );
}

Row buildHeader() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center, // Center align vertically
    children: [
      // Left Portion (Circular Profile Image & Greeting's with Today's Date)
      Row(
        crossAxisAlignment:
            CrossAxisAlignment.center, // Align items in the center vertically
        children: [
          CircleAvatar(
            radius: 28.r, // Adjust the size as needed
            backgroundImage: AssetImage(
              Assets.images.defaultProfilePic.path,
            ), // Default image
          ),
          UIHelper.horizontalSpaceSmall,

          // Greeting's with name & today's date
          buildGreetingsDatePanel(),
        ],
      ),

      // Right Portion (Notification)
      NotificationButton(
        svgAssetPath: Assets.icons.notification,
        showBadge: true,
      ),
    ],
  );
}

Column buildGreetingsDatePanel() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment:
        MainAxisAlignment.center, // Align the entire column to the center
    children: [
      // Greeting's
      Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Hello! ',
              style: TextFontStyle.headline18RegularMontserrat.copyWith(
                color: AppColors.c000B23,
                height: 1.2, // Adjust the line height for better spacing
                letterSpacing: -0.06,
              ),
            ),
            TextSpan(
              text: 'Johan Smith',
              style: TextFontStyle.headline16SemiBoldMontserrat.copyWith(
                color: AppColors.c000B23,
                height: 1.2, // Adjust the line height for better spacing
              ),
            ),
          ],
        ),
        textAlign: TextAlign.left,
      ),
      UIHelper.verticalSpace6,

      // Date
      Text(
        '02 July 2024',
        textAlign: TextAlign.left,
        style: TextFontStyle.headline12RegularMontserrat.copyWith(
          color: AppColors.c7B7B7B,
          letterSpacing: -0.06,
        ),
      ),
    ],
  );
}
