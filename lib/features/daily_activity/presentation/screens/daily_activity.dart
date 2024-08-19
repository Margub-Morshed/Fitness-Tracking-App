import 'package:fitness_tracking_app/core/constants/text_font_style.dart';
import 'package:fitness_tracking_app/core/helpers/ui_helpers.dart';
import 'package:fitness_tracking_app/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/daily_activity.dart';

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
              UIHelper.verticalSpaceSemiLarge,
              buildBurnedCalRow(),
              UIHelper.verticalSpace(16.h),
              buildActivityProgressBar(),
              UIHelper.verticalSpaceMediumLarge,
              buildDistanceCoverageText(),
              UIHelper.verticalSpace(14.h),
              buildStepsWithTime(),
              UIHelper.verticalSpaceSemiLarge,
              Text(
                'Activities',
                style: TextFontStyle.headline20SemiBoldMontserrat,
              ),
              UIHelper.verticalSpace6,
              ...buildActivitiesCardPanel(),
            ],
          ),
        ),
      ),
    );
  }
}
