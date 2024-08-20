import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/text_font_style.dart';
import '../../../../core/helpers/ui_helpers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import 'heart_beat_chart.dart';
import 'home.dart';

class HealthDashboard extends StatelessWidget {
  const HealthDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      child: Row(
        children: [
          _buildLeftColumn(),
          UIHelper.horizontalSpaceSmall,
          _buildRightColumn(),
        ],
      ),
    );
  }

  Widget _buildLeftColumn() {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          buildProgressPanel(
            percent: 0.45,
            label: 'Steps',
            count: '19,124',
            icon: Assets.icons.steps,
            activeColor: AppColors.c68B057,
            inActiveColor: AppColors.cD8E7D5,
          ),
          UIHelper.verticalSpace16,
          buildProgressPanel(
            percent: 0.45,
            label: 'Sleep',
            icon: Assets.icons.sleep,
            activeColor: AppColors.cE07BDC,
            inActiveColor: AppColors.cF3E3F2,
            countWidget: buildProgressCountTSpan(),
            count: '',
          ),
        ],
      ),
    );
  }

  Widget _buildRightColumn() {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.only(top: 12.h),
        child: Column(
          children: [
            _buildHeartRateInfo(),
            SizedBox(
              height: 150.h,
              child: const HeartbeatChart(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProgressPanel({
    required double percent,
    required String label,
    required String count,
    required String icon,
    required Color activeColor,
    required Color inActiveColor,
    Widget? countWidget,
  }) {
    return buildHalfProgressPanel(
      percent: percent,
      label: label,
      count: count,
      icon: icon,
      activeColor: activeColor,
      inActiveColor: inActiveColor,
      countWidget: countWidget,
    );
  }

  Widget _buildHeartRateInfo() {
    return buildProgressInfoCol(
      icon: Assets.icons.heartRate,
      label: 'Heart rate',
      countWidget: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '88',
              style: TextFontStyle.headline20SemiBoldMontserrat,
            ),
            TextSpan(
              text: ' bpm',
              style: TextFontStyle.headline12MediumMontserrat
                  .copyWith(color: AppColors.c494949),
            ),
          ],
        ),
      ),
    );
  }
}
