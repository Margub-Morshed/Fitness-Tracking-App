import 'package:fitness_tracking_app/core/constants/text_font_style.dart';
import 'package:fitness_tracking_app/core/helpers/ui_helpers.dart';
import 'package:fitness_tracking_app/core/widgets/custom_appbar.dart';
import 'package:fitness_tracking_app/features/home/data/models/activities_list.dart';
import 'package:fitness_tracking_app/features/home/data/models/daily_activity.dart';
import 'package:fitness_tracking_app/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../gen/assets.gen.dart';
import '../../../home/presentation/widgets/home.dart';

class DailyActivityScreen extends StatelessWidget {
  const DailyActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Daily Activity', isBackNeeded: true),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(UIHelper.kDefaultPadding()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Today your activities',
                style: TextFontStyle.headline20SemiBoldMontserrat,
              ),
              _buildBurnedCalRow(),
              UIHelper.verticalSpaceMediumLarge,
              Padding(
                padding: EdgeInsets.all(10.sp),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(Assets.icons.distance,
                            height: 20.h, width: 20.w),
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
                                  .copyWith(
                                      color: AppColors.c494949, height: 1.2),
                            ),
                            TextSpan(
                              text: '14.8',
                              style: TextFontStyle.headline20SemiBoldMontserrat
                                  .copyWith(height: 1.2),
                            ),
                            TextSpan(
                              text: ' mi',
                              style: TextFontStyle.headline12MediumMontserrat
                                  .copyWith(
                                      color: AppColors.c494949, height: 1.2),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
              UIHelper.verticalSpace(14.h),
              Row(
                children: [
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
                          Text('19,124',
                              style:
                                  TextFontStyle.headline20SemiBoldMontserrat),
                        ],
                      ),
                    ),
                  ),
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
                                  style: TextFontStyle
                                      .headline20SemiBoldMontserrat,
                                ),
                                TextSpan(
                                  text: 'h ',
                                  style: TextFontStyle
                                      .headline12MediumMontserrat
                                      .copyWith(color: AppColors.c494949),
                                ),
                                TextSpan(
                                  text: '14',
                                  style: TextFontStyle
                                      .headline20SemiBoldMontserrat,
                                ),
                                TextSpan(
                                  text: 'm',
                                  style: TextFontStyle
                                      .headline12MediumMontserrat
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
              ),
              Text(
                'Activities',
                style: TextFontStyle.headline20SemiBoldMontserrat,
              ),
              UIHelper.verticalSpace6,
              ...List.generate(
                ActivitiesListModel.activities.length,
                (index) {
                  final activity = ActivitiesListModel.activities[index];
                  final bool isLast =
                      (index == (ActivitiesListModel.activities.length - 1));

                  return Container(
                      margin:
                          EdgeInsets.only(top: 7.h, bottom: isLast ? 0 : 7.h),
                      child: _buildActivityCard(activity));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildBurnedCalRow() {
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
}
