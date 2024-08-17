import '../../../../../gen/assets.gen.dart';
import 'daily_activity.dart';

class ActivitiesListModel {
  static final List<DailyActivityModel> activities = [
    DailyActivityModel(Assets.images.jogging.path, 'Today, 08:10 AM', '238.2',
        '2.32 miles', '5.00', 'Jogging', false),
    DailyActivityModel(Assets.images.cycling.path, 'Today, 08:10 AM', '563.4',
        '10.00 miles', '10.00', 'Cycling', true),
    DailyActivityModel(Assets.images.yoga.path, 'Today, 06:00 AM', '151.0',
        '6.00 min', '6.00', 'Yoga', true),
  ];
}
