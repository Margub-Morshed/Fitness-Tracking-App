import 'package:fitness_tracking_app/features/goal_tracking/data/models/progress_model.dart';

class ProgressesListModel {
  static List<ProgressModel> progresses = [
    ProgressModel(
      label: 'Chest Workout',
      progressLabel: '5/12',
      time: '15',
      percentage: 0.42,
    ),
    ProgressModel(
      label: 'Legs Workout',
      progressLabel: '3/20',
      time: '23',
      percentage: 0.15,
    ),
    ProgressModel(
      label: 'Arms Workout',
      progressLabel: '9/14',
      time: '18',
      percentage: 0.64,
    ),
  ];
}
