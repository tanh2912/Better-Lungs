import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_flutter/core/const/data_constants.dart';
import 'package:fitness_flutter/core/service/auth_service.dart';
import 'package:fitness_flutter/data/workout_data.dart';

class DataService {
  static final DataService _singleton = DataService._internal();

  factory DataService() {
    return _singleton;
  }

  DataService._internal();

  CollectionReference workouts =
      FirebaseFirestore.instance.collection('workouts');
  Map<String, dynamic> currentWorkouts = {};
  String currentNameEmail = AuthService.getCurrentNameEmail ?? '';

  Future<List<WorkoutData>> getWorkoutsForUser() async {
    try {
      final result = await workouts.doc(currentNameEmail).get();
      if (result.data() != null && result.exists) {
        currentWorkouts = result.data() as Map<String, dynamic>;
        final workouts = List<WorkoutData>.from(DataConstants.workouts);
        for (var key in currentWorkouts.keys) {
          for (var i = 0; i < workouts.length; i++) {
            var isBreak = false;
            for (var j = 0; j < workouts[i].exerciseDataList.length; j++) {
              if (workouts[i].exerciseDataList[j].id == key) {
                workouts[i].exerciseDataList[j].currentSeconds =
                    currentWorkouts[key] ?? 0;
                isBreak = true;
                break;
              }
              if (isBreak) {
                break;
              }
            }
          }
        }
        return workouts;
      } else {
        return DataConstants.workouts;
      }
    } catch (exp) {
      return [];
    }
  }

  Future<void> saveWorkout(Map<String, int> newActiveExs) async {
    try {
      currentWorkouts.addAll(newActiveExs);
      await workouts.doc(currentNameEmail).set(currentWorkouts);
      // ignore: empty_catches
    } catch (exp) {}
  }
}
