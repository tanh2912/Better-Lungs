part of 'workout_details_bloc.dart';

@immutable
abstract class WorkoutDetailsEvent {}

class BackTappedEvent extends WorkoutDetailsEvent {}

class WorkoutExerciseCellTappedEvent extends WorkoutDetailsEvent {
  final ExerciseData currentExercise;
  final ExerciseData? nextExercise;

  WorkoutExerciseCellTappedEvent({
    required this.currentExercise,
    required this.nextExercise,
  });
}

class WorkoutExerciseUserPracticeEvent extends WorkoutDetailsEvent {
  final ExerciseData exerciseData;
  final int currentSecond;

  WorkoutExerciseUserPracticeEvent({
    required this.exerciseData,
    required this.currentSecond,
  });
}
