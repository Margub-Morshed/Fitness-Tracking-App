import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/text_font_style.dart';
import '../../../../core/helpers/ui_helpers.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../gen/assets.gen.dart';
import '../../../home/presentation/widgets/section_header.dart';
import '../widgets/goal_tracking.dart';

class GoalTrackingScreen extends StatelessWidget {
  const GoalTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Goal', isBackNeeded: true),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(UIHelper.kDefaultPadding()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(Assets.images.banner.path),
              UIHelper.verticalSpaceSemiLarge,
              const SectionHeader(title: 'Progress'),
              UIHelper.verticalSpace(14.h),
              Text('Activities',
                  style: TextFontStyle.headline20SemiBoldMontserrat),
              UIHelper.verticalSpace(14.h),
              buildExerciseInfoCard(
                imagePath: Assets.images.fullBody.path,
                title: 'Full Body Warm Up',
                exercises: '20 Exercises',
                duration: '22 Min',
              ),
              UIHelper.verticalSpace(14.h),
              buildExerciseInfoCard(
                imagePath: Assets.images.strengthExercise.path,
                title: 'Strength Exercise',
                exercises: '12 Exercises',
                duration: '14 Min',
              ),
              UIHelper.verticalSpace(14.h),
              buildExerciseInfoCard(
                imagePath: Assets.images.bothSide.path,
                title: 'Both Side Plank',
                exercises: '15 Exercises',
                duration: '18 Min',
              ),
              UIHelper.verticalSpace(14.h),
              buildExerciseInfoCard(
                imagePath: Assets.images.absWorkout.path,
                title: 'Abs Workout',
                exercises: '16 Exercises',
                duration: '18 Min',
              ),
              UIHelper.verticalSpace(14.h),
              buildExerciseInfoCard(
                imagePath: Assets.images.torsoTrap.path,
                title: 'Torso and Trap Workout',
                exercises: '8 Exercises',
                duration: '10 Min',
              ),
              UIHelper.verticalSpace(14.h),
              buildExerciseInfoCard(
                imagePath: Assets.images.lowerBack.path,
                title: 'Lower Back Exercise',
                exercises: '14 Exercises',
                duration: '18 Min',
              ),
              UIHelper.verticalSpaceSemiLarge,
              const SectionHeader(title: 'Goal Progress', option: ''),
            ],
          ),
        ),
      ),
    );
  }
}
