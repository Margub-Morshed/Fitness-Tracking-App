import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/text_font_style.dart';
import '../../../../core/helpers/ui_helpers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../home/presentation/widgets/home.dart';
import 'package:fitness_tracking_app/features/home/data/models/activities_list.dart';
import 'package:fitness_tracking_app/features/home/data/models/daily_activity.dart';
import 'package:fitness_tracking_app/gen/colors.gen.dart';

Padding buildDistanceCoverageText() {
  return Padding(
    padding: EdgeInsets.all(10.sp),
    child: Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(Assets.icons.distance, height: 20.h, width: 20.w),
            UIHelper.horizontalSpace(2.w),
            Text(
              'Distance',
              style: TextFontStyle.headline14MediumMontserrat
                  .copyWith(color: AppColors.c494949),
            ),
          ],
        ),
        UIHelper.verticalSpaceSmall,
        Align(
          alignment: Alignment.centerRight,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'You have covered   ',
                  style: TextFontStyle.headline14RegularMontserrat
                      .copyWith(color: AppColors.c494949, height: 1.2),
                ),
                TextSpan(
                  text: '14.8',
                  style: TextFontStyle.headline20SemiBoldMontserrat
                      .copyWith(height: 1.2),
                ),
                TextSpan(
                  text: ' mi',
                  style: TextFontStyle.headline12MediumMontserrat
                      .copyWith(color: AppColors.c494949, height: 1.2),
                ),
              ],
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    ),
  );
}

Row buildStepsWithTime() {
  return Row(
    children: [
      // Step's
      Expanded(
        flex: 1,
        child: Container(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(Assets.icons.steps,
                      height: 18.h, width: 18.w),
                  UIHelper.horizontalSpace(2.w),
                  Text(
                    'Steps',
                    style: TextFontStyle.headline14MediumMontserrat
                        .copyWith(color: AppColors.c494949),
                  )
                ],
              ),
              UIHelper.verticalSpace12,
              Text('19,124', style: TextFontStyle.headline20SemiBoldMontserrat),
            ],
          ),
        ),
      ),

      // Time
      Expanded(
        flex: 1,
        child: Container(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(Assets.icons.time,
                      height: 18.h, width: 18.w),
                  UIHelper.horizontalSpace(2.w),
                  Text(
                    'Time',
                    style: TextFontStyle.headline14MediumMontserrat
                        .copyWith(color: AppColors.c494949),
                  )
                ],
              ),
              UIHelper.verticalSpace12,
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '2',
                      style: TextFontStyle.headline20SemiBoldMontserrat,
                    ),
                    TextSpan(
                      text: 'h ',
                      style: TextFontStyle.headline12MediumMontserrat
                          .copyWith(color: AppColors.c494949),
                    ),
                    TextSpan(
                      text: '14',
                      style: TextFontStyle.headline20SemiBoldMontserrat,
                    ),
                    TextSpan(
                      text: 'm',
                      style: TextFontStyle.headline12MediumMontserrat
                          .copyWith(color: AppColors.c494949),
                    ),
                  ],
                ),
                textAlign: TextAlign.right,
              )
            ],
          ),
        ),
      ),
    ],
  );
}

List<Widget> buildActivitiesCardPanel() {
  return List.generate(
    ActivitiesListModel.activities.length,
    (index) {
      final activity = ActivitiesListModel.activities[index];
      final bool isLast =
          (index == (ActivitiesListModel.activities.length - 1));

      return Container(
          margin: EdgeInsets.only(top: 7.h, bottom: isLast ? 0 : 7.h),
          child: _buildActivityCard(activity));
    },
  );
}

Widget buildActivityProgressBar() {
  return Container(
    height: 200.h,
    padding: EdgeInsets.only(left: 10.w),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left Side: Image and Activity Name
        Expanded(
          flex: 3,
          child: Column(
            children: [
              buildLeftPortion(
                  activityName: 'Jogging',
                  imagePath: Assets.images.jogging.path),
              UIHelper.verticalSpace(16.h),
              buildLeftPortion(
                  activityName: 'Cycling',
                  imagePath: Assets.images.cycling.path),
              UIHelper.verticalSpace(16.h),
              buildLeftPortion(
                  activityName: 'Yoga', imagePath: Assets.images.yoga.path),
              UIHelper.verticalSpace(16.h),
              buildLeftPortion(activityName: 'Others'),
            ],
          ),
        ),
        UIHelper.horizontalSpace(8.w),

        // Divider between left and right
        SizedBox(
          height: 180.h,
          child: VerticalDivider(color: AppColors.cD0D5DD, thickness: 1.sp),
        ),
        UIHelper.horizontalSpace(18.w),

        // Right Side: Progress Bar and Percentage Label
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildRightPortion(
                percentage: 0.22,
                progressColor: Colors.amber,
                percentageLabel: '22%',
              ),
              buildRightPortion(
                percentage: 0.50,
                progressColor: Colors.blue,
                percentageLabel: '50%',
              ),
              buildRightPortion(
                percentage: 0.13,
                progressColor: Colors.red,
                percentageLabel: '13%',
              ),
              buildRightPortion(
                percentage: 0.15,
                progressColor: Colors.black,
                percentageLabel: '15%',
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildRightPortion(
    {required double percentage,
    required Color progressColor,
    required String percentageLabel}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        height: 10.h, // Set the height of the progress bar
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 240.w * percentage, // Width based on percentage
            height: double.infinity,
            color: progressColor, // Color for the completed portion
          ),
        ),
      ),
      UIHelper.horizontalSpace(8.w),
      Text(
        percentageLabel,
        style: TextFontStyle.headline12MediumMontserrat
            .copyWith(color: progressColor),
      ),
    ],
  );
}

Row buildLeftPortion({final String? imagePath, required String activityName}) {
  return Row(
    children: [
      SizedBox(
        width: 70.w,
        child: Text(
          activityName,
          style: TextFontStyle.headline14MediumMontserrat
              .copyWith(color: AppColors.c494949),
        ),
      ),
      UIHelper.horizontalSpace(8.w),
      imagePath != null
          ? Image.asset(imagePath, height: 40.h, width: 40.w)
          : const SizedBox.shrink(),
    ],
  );
}

Row buildBurnedCalRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'You’ve burned',
        style: TextFontStyle.headline16SemiBoldMontserrat
            .copyWith(color: AppColors.c494949),
      ),
      UIHelper.verticalSpaceSemiLarge,

      // Calory count with icon
      Row(
        children: [
          SvgPicture.asset(Assets.icons.calories, height: 32.h, width: 32.w),
          Text.rich(
            TextSpan(
              children: [
                // Calory Count
                TextSpan(
                  text: '1,116.5',
                  style: TextFontStyle.headline24SemiBoldMontserrat,
                ),
                TextSpan(
                  text: ' cal',
                  style: TextFontStyle.headline16MediumMontserrat
                      .copyWith(color: AppColors.c110C11),
                ),
              ],
            ),
          )
        ],
      )
    ],
  );
}

Container _buildActivityCard(DailyActivityModel activity) {
  return Container(
    padding: EdgeInsets.all(12.sp),
    child: Column(
      children: [
        buildHeaderRow(activity),
        UIHelper.verticalSpaceSmall,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildActivityRow(activity),
            buildStatusIcon(activity),
          ],
        ),
      ],
    ),
  );
}
