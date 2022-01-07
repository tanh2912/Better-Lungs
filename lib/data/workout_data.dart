import 'dart:convert';

import 'package:fitness_flutter/data/exercise_data.dart';

class WorkoutData {
  late String id;
  late String title;
  late String exercises;
  late String seconds;
  int? currentProgress;
  late int progress;
  late String image;
  late List<ExerciseData> exerciseDataList;

  WorkoutData({
    required this.id,
    required this.title,
    required this.exercises,
    required this.seconds,
    required this.currentProgress,
    required this.progress,
    required this.image,
    required this.exerciseDataList,
  });

  WorkoutData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    exercises = json['exercises'];
    seconds = json['seconds'];
    currentProgress = json['currentProgress'];
    progress = json['progress'];
    image = json['image'];
    if (json['exerciseDataList'] != null) {
      List<ExerciseData> exercises = [];
      json['exerciseDataList'].forEach((v) {
        exercises.add(ExerciseData.fromJson(v));
      });
      exerciseDataList = exercises;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['exercises'] = exercises;
    data['seconds'] = seconds;
    data['currentProgress'] = currentProgress;
    data['progress'] = progress;
    data['image'] = image;
    data['exerciseDataList'] =
        exerciseDataList.map((v) => v.toJson()).toList();
    return data;
  }

  String toJsonString() {
    final str = json.encode(toJson());
    return str;
  }
}