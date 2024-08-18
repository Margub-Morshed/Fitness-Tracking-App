class DailyActivityModel {
  final String imagePath;
  final String dateTime;
  final String calories;
  final String target;
  final String achievement;
  final String activity;
  final bool isAchieved;

  DailyActivityModel(this.imagePath, this.dateTime, this.calories, this.target,
      this.achievement, this.activity, this.isAchieved);
}
