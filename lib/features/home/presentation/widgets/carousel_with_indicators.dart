import 'package:fitness_tracking_app/features/home/presentation/data/models/daily_activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../../core/constants/text_font_style.dart';
import '../../../../core/helpers/ui_helpers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../screens/home.dart';

class CarouselWithIndicators extends StatelessWidget {
  final ValueNotifier<int> currentIndexNotifier;
  final List<DailyActivityModel> activities;

  const CarouselWithIndicators({
    super.key,
    required this.activities,
    required this.currentIndexNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Carousel Slider
        CarouselSlider.builder(
          itemCount:
              activities.length, // Adjust the number of items in the carousel
          itemBuilder: (context, index, realIndex) {
            return _buildCarouselItem(index);
          },
          options: CarouselOptions(
            height: 170.h, // Adjust height as needed
            viewportFraction: 0.75,
            initialPage: 0,
            autoPlay: false,
            onPageChanged: (index, reason) {
              currentIndexNotifier.value = index;
            },
          ),
        ),

        // Dots Indicator
        ValueListenableBuilder<int>(
          valueListenable: currentIndexNotifier,
          builder: (context, currentIndex, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                activities
                    .length, // Number of indicators (should match itemCount)
                (index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Container(
                    width: 12.w,
                    height: 12.h,
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? AppColors.cADADAD
                          : AppColors.cD9D9D9,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildCarouselItem(int index) {
    final DailyActivityModel activity = activities[index];

    return Container(
      // Left Aligned Carousel Slider's
      transform: Matrix4.translationValues(-350 / 8, 0, 0),
      width: 250.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      child: Column(
        children: [
          // Add your carousel item content here
          Row(
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SvgPicture.asset(Assets.icons.calories,
                      height: 16.h, width: 16.w),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${activity.calories} ',
                          style: TextFontStyle.headline12MediumMontserrat,
                        ),
                        TextSpan(
                          text: 'cal',
                          style: TextFontStyle.headline10RegularMontserrat
                              .copyWith(
                            color: AppColors.c494949,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          UIHelper.verticalSpaceSmall,
          Row(
            children: [
              CircleAvatar(
                radius: 36.sp,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(activity.imagePath),
              ),
              UIHelper.horizontalSpace(12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
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
                            style: TextFontStyle.headline16MediumMontserrat
                                .copyWith(
                              color: AppColors.c494949,
                            ),
                          ),
                        ],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  UIHelper.verticalSpace4,
                  Text(
                    activity.activity,
                    style: TextFontStyle.headline14MediumMontserrat.copyWith(
                      color: AppColors.c494949,
                    ),
                  ),
                ],
              ),
            ],
          ),
          UIHelper.verticalSpaceMedium,
          Align(
            alignment: Alignment.centerRight,
            child: SvgPicture.asset(
                activity.isAchieved ? Assets.icons.tick : Assets.icons.pause,
                height: 28.h,
                width: 28.w),
          ),
        ],
      ),
    );
  }
}
