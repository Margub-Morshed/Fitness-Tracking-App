import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../../gen/colors.gen.dart';
import '../../data/models/chart_data.dart';
import '../../data/models/heart_data_list.dart';

class HeartbeatChart extends StatelessWidget {
  const HeartbeatChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0, // Remove the border
      primaryXAxis: NumericAxis(
        isVisible: false, // Hide the X axis
      ),
      primaryYAxis: NumericAxis(
        isVisible: false, // Hide the Y axis
      ),
      series: <SplineAreaSeries<ChartDataModel, double>>[
        SplineAreaSeries<ChartDataModel, double>(
          dataSource: HeartDataList.get(),
          xValueMapper: (ChartDataModel data, _) => data.x,
          yValueMapper: (ChartDataModel data, _) => data.y,
          gradient: LinearGradient(
            colors: [
              AppColors.cF7B486, // Start with the line's color
              Colors.white.withOpacity(0), // Gradually fade to white
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderColor: AppColors.cF7B486, // Color of the waveform line
          borderWidth: 2, // Thickness of the line
        ),
      ],
    );
  }
}
