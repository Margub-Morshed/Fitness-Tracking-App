// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitness_tracking_app/features/home/presentation/data/models/daily_activity.dart';
import 'package:fitness_tracking_app/features/home/presentation/widgets/carousel_with_indicators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fitness_tracking_app/core/helpers/ui_helpers.dart';
import 'package:fitness_tracking_app/gen/assets.gen.dart';
import 'package:fitness_tracking_app/gen/colors.gen.dart';
import '../../../../core/constants/text_font_style.dart';
import '../widgets/notification_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);

  final List<DailyActivityModel> activities = [
    DailyActivityModel(Assets.images.jogging.path, 'Today, 08:10 AM', '238.2',
        '2.32 miles', '5.00', 'Jogging', false),
    DailyActivityModel(Assets.images.cycling.path, 'Today, 08:10 AM', '563.4',
        '10.00 miles', '10.00', 'Cycling', true),
    DailyActivityModel(Assets.images.yoga.path, 'Today, 06:00 AM', '151.0',
        '6.00 min', '6.00', 'Yoga', true),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(UIHelper.kDefaultPadding()),
          child: Column(
            children: [
              _buildHeader(),
              UIHelper.verticalSpace16,
              UIHelper.verticalSpace(14.h),
              const SectionHeader(title: 'Your Statistics'),
              UIHelper.verticalSpace(14.h),
              const SectionHeader(title: 'Daily Activities'),
              UIHelper.verticalSpace(14.h),
              CarouselWithIndicators(
                activities: activities,
                currentIndexNotifier: _currentIndexNotifier,
              ),
              UIHelper.verticalSpace(14.h),
              UIHelper.verticalSpace16,
              const SectionHeader(title: 'Goals', option: 'View All'),
              UIHelper.verticalSpace(8.h),
              const GoalCard(
                title: 'ABS & Stretch',
                dateTime: 'Saturday, April 14 | 08:00 AM',
                duration: '30 Min/day',
              ),
              const GoalCard(
                title: 'Push Up',
                dateTime: 'Sunday, April 15 | 08:00 AM',
                duration: '50 Sets/day',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildHeader() {
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
            _buildGreetingsDatePanel(),
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

  Column _buildGreetingsDatePanel() {
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
}

class DotDivider extends StatelessWidget {
  const DotDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      height: 2,
      decoration: const ShapeDecoration(
        color: AppColors.c110C11,
        shape: CircleBorder(),
      ),
    );
  }
}

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

class SectionHeader extends StatelessWidget {
  final String title;
  final String option;
  final VoidCallback? onTap;

  const SectionHeader(
      {super.key, this.onTap, required this.title, this.option = "See All"});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextFontStyle.headline20SemiBoldMontserrat),
        InkWell(
          onTap: onTap,
          child: Text(
            option,
            style: TextFontStyle.headline16MediumMontserrat.copyWith(
              color: AppColors.cF97316,
              letterSpacing: -0.08,
            ),
          ),
        ),
      ],
    );
  }
}
