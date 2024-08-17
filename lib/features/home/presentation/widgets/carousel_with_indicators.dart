import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitness_tracking_app/features/home/presentation/data/models/daily_activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/ui_helpers.dart';
import '../../../../gen/colors.gen.dart';
import 'home.dart';

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
        _buildCarouselSlider(),
        _buildDotsIndicator(),
      ],
    );
  }

  Widget _buildCarouselSlider() {
    return CarouselSlider.builder(
      itemCount: activities.length,
      itemBuilder: (context, index, realIndex) {
        return _buildCarouselItem(index);
      },
      options: CarouselOptions(
        height: 160.h,
        viewportFraction: 0.75,
        autoPlay: false,
        onPageChanged: (index, reason) {
          currentIndexNotifier.value = index;
        },
      ),
    );
  }

  Widget _buildDotsIndicator() {
    return ValueListenableBuilder<int>(
      valueListenable: currentIndexNotifier,
      builder: (context, currentIndex, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            activities.length,
            (index) => _buildDotIndicator(index, currentIndex),
          ),
        );
      },
    );
  }

  Widget _buildDotIndicator(int index, int currentIndex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Container(
        height: 12.h,
        width: 12.w,
        decoration: BoxDecoration(
          color: currentIndex == index ? AppColors.cADADAD : AppColors.cD9D9D9,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget _buildCarouselItem(int index) {
    final DailyActivityModel activity = activities[index];

    return Container(
      transform: Matrix4.translationValues(-350 / 8, 0, 0),
      width: 250.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      child: Column(
        children: [
          buildHeaderRow(activity),
          UIHelper.verticalSpaceSmall,
          buildActivityRow(activity),
          UIHelper.verticalSpaceMedium,
          buildStatusIcon(activity),
        ],
      ),
    );
  }
}
