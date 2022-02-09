part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class ReloadDisplayNameEvent extends HomeEvent {}

class ReloadImageEvent extends HomeEvent {}

class UserPracticeEvent extends HomeEvent {
  final WorkoutData workoutData;
  UserPracticeEvent({required this.workoutData});
}
