import 'dart:convert';

import 'package:fitness_flutter/data/exercise_data.dart';
import 'package:flutter/material.dart';

class WorkoutData {
  late String id;
  late String title;
  late Color color;
  late int currentProgress;
  late int progress;
  late String image;
  late List<ExerciseData> exerciseDataList;

  WorkoutData({
    required this.id,
    required this.title,
    required this.color,
    required this.currentProgress,
    required this.progress,
    required this.image,
    required this.exerciseDataList,
  });

  String get totalExercises => exerciseDataList.length >= 10
      ? exerciseDataList.length.toString()
      : "0${exerciseDataList.length}";

  String totalSeconds() {
    var totalTime = 0;
    exerciseDataList.forEach((element) {
      totalTime += element.seconds;
    });
    return totalTime.toString();
  }

  WorkoutData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    color = json['color']; // seconds = json['seconds'];
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
    data['color'] = color;
    data['currentProgress'] = currentProgress;
    data['progress'] = progress;
    data['image'] = image;
    data['exerciseDataList'] = exerciseDataList.map((v) => v.toJson()).toList();
    return data;
  }

  String toJsonString() {
    final str = json.encode(toJson());
    return str;
  }
}
