import 'dart:convert';

import 'package:fitness_flutter/data/exercise_data.dart';
import 'package:flutter/material.dart';

class WorkoutData {
  late String id;
  late String title;
  late Color color;
  late String image;
  late List<ExerciseData> exerciseDataList;

  WorkoutData({
    required this.id,
    required this.title,
    required this.color,
    required this.image,
    required this.exerciseDataList,
  });

  int get totalFinished =>
      exerciseDataList.where((element) => element.isFisnished).length;

  int get totalInProgress =>
      exerciseDataList.where((element) => element.isProgress).length;

  int get totalExercises => exerciseDataList.length;

  int totalSeconds() {
    var totalTime = 0;
    for (var element in exerciseDataList) {
      totalTime += element.seconds;
    }
    return totalTime;
  }

  int totalSecondsInprogress() {
    var totalTime = 0;
    for (var element in exerciseDataList) {
      totalTime += element.currentSeconds;
    }
    return totalTime;
  }

  int getProgressPercentage() {
    return (totalSecondsInprogress() * 100 / totalSeconds()).floor();
  }

  WorkoutData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    color = json['color'];
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
    data['image'] = image;
    data['exerciseDataList'] = exerciseDataList.map((v) => v.toJson()).toList();
    return data;
  }

  String toJsonString() {
    final str = json.encode(toJson());
    return str;
  }
}
