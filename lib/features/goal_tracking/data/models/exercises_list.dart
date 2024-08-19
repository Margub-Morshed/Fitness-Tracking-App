import 'package:fitness_tracking_app/features/goal_tracking/data/models/exercises_info.dart';
import '../../../../gen/assets.gen.dart';

class ExercisesList {
  static List<ExerciseInfoModel> exercises = [
    ExerciseInfoModel(
      imagePath: Assets.images.fullBody.path,
      title: 'Full Body Warm Up',
      exercises: '20 Exercises',
      duration: '22 Min',
    ),
    ExerciseInfoModel(
      imagePath: Assets.images.strengthExercise.path,
      title: 'Strength Exercise',
      exercises: '12 Exercises',
      duration: '14 Min',
    ),
    ExerciseInfoModel(
      imagePath: Assets.images.bothSide.path,
      title: 'Both Side Plank',
      exercises: '15 Exercises',
      duration: '18 Min',
    ),
    ExerciseInfoModel(
      imagePath: Assets.images.absWorkout.path,
      title: 'Abs Workout',
      exercises: '16 Exercises',
      duration: '18 Min',
    ),
    ExerciseInfoModel(
      imagePath: Assets.images.torsoTrap.path,
      title: 'Torso and Trap Workout',
      exercises: '8 Exercises',
      duration: '10 Min',
    ),
    ExerciseInfoModel(
      imagePath: Assets.images.lowerBack.path,
      title: 'Lower Back Exercise',
      exercises: '14 Exercises',
      duration: '18 Min',
    ),
  ];
}
