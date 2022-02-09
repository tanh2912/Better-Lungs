import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fitness_flutter/core/service/data_service.dart';
import 'package:fitness_flutter/data/exercise_data.dart';
import 'package:fitness_flutter/data/workout_data.dart';
import 'package:fitness_flutter/screens/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'workout_details_event.dart';

part 'workout_details_state.dart';

class WorkoutDetailsBloc
    extends Bloc<WorkoutDetailsEvent, WorkoutDetailsState> {
  final WorkoutData workout;
  final HomeBloc homeBloc;

  WorkoutDetailsBloc({required this.workout, required this.homeBloc})
      : super(WorkoutDetailsInitial());

  @override
  Stream<WorkoutDetailsState> mapEventToState(
    WorkoutDetailsEvent event,
  ) async* {
    if (event is BackTappedEvent) {
      yield BackTappedState();
    } else if (event is WorkoutExerciseCellTappedEvent) {
      yield WorkoutExerciseCellTappedState(
        currentExercise: event.currentExercise,
        nextExercise: event.nextExercise,
      );
    } else if (event is WorkoutExerciseUserPracticeEvent) {
      print(
          "===========SOME THING WorkoutDetailsBloc CALL EVENT==============");
      for (final exs in workout.exerciseDataList) {
        if (exs.id == event.exerciseData.id) {
          exs.currentSeconds = event.currentSecond;
          DataService().saveWorkout({exs.id: event.currentSecond});
          homeBloc.add(UserPracticeEvent(workoutData: workout));
        }
      }
      yield WorkoutExcerciseUserPracticeState();
    }
  }
}
