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
    var totalTime = 0;
    for (var i = 0; i < workouts.length; i++) {
      totalTime += workouts[i].totalSeconds();
    }
    return (getTimeSent() * 100 / totalTime).floor();
  }

  int getFinishedWorkouts() {
    var totalFinish = 0;
    for (var i = 0; i < workouts.length; i++) {
      for (var j = 0; j < workouts[i].exerciseDataList.length; j++) {
        if (workouts[i].exerciseDataList[j].isFisnished) {
          totalFinish += 1;
        }
      }
    }
    return totalFinish;
  }

  int getInProgressWorkouts() {
    var totalInProgress = 0;
    for (var i = 0; i < workouts.length; i++) {
      for (var j = 0; j < workouts[i].exerciseDataList.length; j++) {
        if (workouts[i].exerciseDataList[j].isProgress) {
          totalInProgress += 1;
        }
      }
    }
    return totalInProgress;
  }

  int getTimeSent() {
    var timeSent = 0;
    for (final WorkoutData workout in workouts) {
      for (final exs in workout.exerciseDataList) {
        timeSent += exs.currentSeconds;
      }
    }
    return timeSent;
  }
}
