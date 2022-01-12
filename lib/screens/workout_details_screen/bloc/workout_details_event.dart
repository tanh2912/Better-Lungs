part of 'workout_details_bloc.dart';

abstract class WorkoutDetailsEvent {}

class BackTappedEvent extends WorkoutDetailsEvent {}

class WorkoutDetailsInitialEvent extends WorkoutDetailsEvent {
  final WorkoutData workout;

  WorkoutDetailsInitialEvent({
    required this.workout,
  });
}

class StartTappedEvent extends WorkoutDetailsEvent {
  final WorkoutData workout;
  final int index;
  final bool isReplace;

  StartTappedEvent({
    required this.workout,
    required this.index,
    this.isReplace = false,
  });
}