import 'package:fitness_tracking_app/features/goal_tracking/data/models/exercises_list.dart';
import 'package:fitness_tracking_app/features/goal_tracking/data/models/progresses_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/text_font_style.dart';
import '../../../../core/helpers/ui_helpers.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../gen/assets.gen.dart';
import '../../../home/presentation/widgets/section_header.dart';
import '../widgets/goal_tracking.dart';
import '../widgets/progress_bar.dart';

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
              SizedBox(
                height: 190.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: ProgressesListModel.progresses.length,
                  separatorBuilder: (context, index) =>
                      UIHelper.horizontalSpace(UIHelper.kDefaultPadding()),
                  itemBuilder: (context, index) {
                    final progress = ProgressesListModel.progresses[index];
                    return ProgressBar(
                      percentage: progress.percentage,
                      progressLabel: progress.progressLabel,
                      label: progress.label,
                      time: progress.time,
                    );
                  },
                ),
              ),
              UIHelper.verticalSpace(14.h),
              Text('Activities',
                  style: TextFontStyle.headline20SemiBoldMontserrat),
              UIHelper.verticalSpace(14.h),
              ...List.generate(ExercisesList.exercises.length, (index) {
                final exercise = ExercisesList.exercises[index];
                return Column(
                  children: [
                    buildExerciseInfoCard(
                      imagePath: exercise.imagePath,
                      title: exercise.title,
                      exercises: exercise.exercises,
                      duration: exercise.duration,
                    ),

                    // Separated Widget (Spacer)
                    if (index <
                        ExercisesList.exercises.length -
                            1) // Indicates except last
                      UIHelper.verticalSpace(14.h),
                  ],
                );
              }),
              UIHelper.verticalSpaceSemiLarge,
              const SectionHeader(title: 'Goal Progress', option: ''),
            ],
          ),
        ),
      ),
    );
  }
}
