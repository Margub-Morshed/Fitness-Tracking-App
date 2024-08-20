import 'chart_data.dart';

class HeartDataList {
  // Function to generate sample waveform data
  static List<ChartDataModel> get() {
    return <ChartDataModel>[
      ChartDataModel(0, 3),
      ChartDataModel(2.6, 2),
      ChartDataModel(4.9, 5),
      ChartDataModel(6.8, 2.5),
      ChartDataModel(8, 4),
      ChartDataModel(9.5, 3),
      ChartDataModel(11, 4),
    ];
  }
}
