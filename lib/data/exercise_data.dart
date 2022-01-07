import 'dart:convert';

class ExerciseData {

  late String title;
  late int seconds;
  late String image;
  late double progress;
  late String video;
  late String description;
  late List<String> steps;

  ExerciseData({

    required this.title,
    required this.image,
    required this.seconds,
    required this.progress,
    required this.video,
    required this.description,
    required this.steps,
  });

  ExerciseData.fromJson(Map<String, dynamic> json) {

    title = json['title'];
    image = json['image'];
    seconds = json['seconds'];
    progress = json['progress'];
    video = json['video'];
    description = json['description'];
    steps = json['steps'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['title'] = title;
    data['image'] = image;
    data['seconds'] = seconds;
    data['progress'] = progress;
    data['video'] = video;
    data['description'] = description;
    data['steps'] = steps;
    return data;
  }

  String toJsonString() {
    final str = json.encode(toJson());
    return str;
  }
}
