import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HalfLinearProgressIndicator extends StatelessWidget {
  final double percent;
  final double? height;
  final double? radius;
  final Color activeColor;
  final Color inActiveColor;

  const HalfLinearProgressIndicator({
    super.key,
    this.height,
    this.radius,
    required this.percent,
    required this.activeColor,
    required this.inActiveColor,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Align(
        alignment: Alignment.bottomCenter, // Align to show the top half
        heightFactor: 0.5, // Show only the top half
        child: LinearPercentIndicator(
          padding: EdgeInsets.zero,
          animation: true,
          lineHeight: height ?? 8.h, // Full height of the indicator
          animationDuration: 1200,
          animateFromLastPercent: true,
          percent: percent,
          linearStrokeCap: LinearStrokeCap.roundAll,
          barRadius: Radius.circular(radius ?? 16.r),
          progressColor: activeColor,
          backgroundColor: inActiveColor,
        ),
      ),
    );
  }
}
