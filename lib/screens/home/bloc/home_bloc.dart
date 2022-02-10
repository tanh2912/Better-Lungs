// ignore_for_file: avoid_print

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fitness_flutter/core/service/auth_service.dart';
import 'package:fitness_flutter/core/service/data_service.dart';
import 'package:fitness_flutter/core/service/user_storage_service.dart';
import 'package:fitness_flutter/data/workout_data.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial());

  List<WorkoutData> workouts = <WorkoutData>[];

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeInitialEvent) {
      workouts = await DataService().getWorkoutsForUser();
      yield WorkoutsGotState(workouts: workouts);
    } else if (event is ReloadImageEvent) {
      String? photoURL = await UserStorageService.readSecureData('image');
      if (photoURL == null) {
        photoURL = AuthService.auth.currentUser?.photoURL;
        photoURL != null
            ? await UserStorageService.writeSecureData('image', photoURL)
            : print('no image');
      }
      yield ReloadImageState(photoURL: photoURL);
    } else if (event is ReloadDisplayNameEvent) {
      final displayName = await UserStorageService.readSecureData('name');
      yield ReloadDisplayNameState(displayName: displayName);
    } else if (event is UserPracticeEvent) {
      for (var i = 0; i < workouts.length; i++) {
        if (workouts[i].id == event.workoutData.id) {
          workouts[i] = event.workoutData;
        }
      }
      yield HomeUserUpdateWorkoutsSate();
    }
  }

  int getProgressPercentage() {
    var totalExs = 0;
    for (final wk in workouts) {
      totalExs += wk.totalExercises;
    }
    if (totalExs == 0) {
      return 0;
    }
    return (getFinishedWorkouts() * 100 / totalExs).floor();
  }

  int getFinishedWorkouts() {
    var totalFinish = 0;
    for (final wk in workouts) {
      totalFinish += wk.totalFinished;
    }
    return totalFinish;
  }

  int getInProgressWorkouts() {
    var totalInProgress = 0;
    for (final wk in workouts) {
      totalInProgress += wk.totalInProgress;
    }
    return totalInProgress;
  }

  int getTimeSent() {
    var timeSent = 0;
    for (final wk in workouts) {
      timeSent += wk.totalSecondsInprogress();
    }
    return timeSent;
  }
}
