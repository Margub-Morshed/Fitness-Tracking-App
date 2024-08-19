import 'package:fitness_tracking_app/core/constants/text_font_style.dart';
import 'package:fitness_tracking_app/core/helpers/ui_helpers.dart';
import 'package:fitness_tracking_app/gen/assets.gen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../gen/colors.gen.dart';

class CustomBarChart extends StatelessWidget {
  const CustomBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(4.r);
    final barChartWidth = 16.w;
    const Color activeColor = AppColors.c110C11;
    const Color inActiveColor = AppColors.c4D494D;

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,

        // In order to draw horizontal lines at 0 and 2000 on the chart's Y-axis..
        // 2000 + 1 & - 1 => Actual difference made of 2k.
        maxY: 2001,
        minY: -1,
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            getTooltipColor: (group) => Colors.transparent,
            tooltipPadding: EdgeInsets.zero,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return null;
            },
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              getTitlesWidget: (double value, TitleMeta meta) {
                final style = TextFontStyle.headline12MediumMontserrat
                    .copyWith(color: activeColor);
                Widget text;
                switch (value.toInt()) {
                  case 0:
                    text = Text('S', style: style);
                    break;
                  case 1:
                    text = buildAdvanceTitle(
                        day: 'M', style: style, color: inActiveColor);
                    break;
                  case 2:
                    text = Text('T', style: style);
                    break;
                  case 3:
                    text = Text('W', style: style);
                    break;
                  case 4:
                    text = buildAdvanceTitle(
                        day: 'T', style: style, color: inActiveColor);
                    break;
                  case 5:
                    text = buildAdvanceTitle(day: 'F', style: style);
                    break;
                  case 6:
                    text = Text('S', style: style);
                    break;
                  default:
                    text = Text('NA', style: style);
                    break;
                }
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  space: 4.sp, // Space between the bar and the label
                  child: text,
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                if (value == 0 || value == 2000) {
                  return Text(
                    value == 0 ? '0' : '2k',
                    style: TextFontStyle.headline12MediumMontserrat
                        .copyWith(color: inActiveColor),
                  );
                }
                return const SizedBox.shrink();
              },
              reservedSize: 40.w,
            ),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        gridData: FlGridData(
          show: true,
          drawHorizontalLine: true,
          horizontalInterval: 2000, // Draw only at 0 and 2k
          getDrawingHorizontalLine: (value) {
            if (value == 0 || value == 2000) {
              return FlLine(color: AppColors.cD9D8D9, strokeWidth: 0.5.w);
            }
            return const FlLine(color: Colors.transparent);
          },
          drawVerticalLine: false, // No vertical grid lines
        ),
        borderData: FlBorderData(show: false),

        // Vertical Bar's
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(
                toY: 1400.sp, // Scale this according to your actual data
                color: inActiveColor,
                width: barChartWidth,
                borderRadius: borderRadius,
              ),
            ],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(
                toY: 2050.sp,
                color: inActiveColor,
                width: barChartWidth,
                borderRadius: borderRadius,
              ),
            ],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(
                toY: 2150.sp,
                color: inActiveColor,
                width: barChartWidth,
                borderRadius: borderRadius,
              ),
            ],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [
              BarChartRodData(
                toY: 1200.sp,
                color: inActiveColor,
                width: barChartWidth,
                borderRadius: borderRadius,
              ),
            ],
          ),
          BarChartGroupData(
            x: 4,
            barRods: [
              BarChartRodData(
                toY: 900.sp,
                color: inActiveColor,
                width: barChartWidth,
                borderRadius: borderRadius,
              ),
            ],
          ),
          BarChartGroupData(
            x: 5,
            barRods: [
              BarChartRodData(
                toY: 2400.sp,
                color: activeColor,
                width: barChartWidth,
                borderRadius: borderRadius,
              ),
            ],
          ),
          BarChartGroupData(
            x: 6,
            barRods: [
              BarChartRodData(
                toY: 0.sp,
                color: inActiveColor,
                width: barChartWidth,
                borderRadius: borderRadius,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding buildAdvanceTitle(
      {required TextStyle style, required String day, Color? color}) {
    return Padding(
      padding: EdgeInsets.only(right: 4.w),
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.icons.done,
            color: color,
          ),
          UIHelper.horizontalSpace(3.w),
          Text(day, style: style),
        ],
      ),
    );
  }
}
