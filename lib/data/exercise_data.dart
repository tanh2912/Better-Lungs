import 'dart:convert';

class ExerciseData {
  late String title;
  late int seconds;
  late double progress;
  late String video;
  late String description;
  late String image;
  late List<String> steps;

  ExerciseData({
    required this.title,
    required this.seconds,
    required this.progress,
    required this.video,
    required this.description,
    required this.image,
    required this.steps,
  });

  ExerciseData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    seconds = json['seconds'];
    progress = json['progress'];
    video = json['video'];
    description = json['description'];
    image = json['image'];
    steps = json['steps'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['seconds'] = seconds;
    data['progress'] = progress;
    data['video'] = video;
    data['image'] = image;
    data['description'] = description;
    data['steps'] = steps;
    return data;
  }

  String toJsonString() {
    final str = json.encode(toJson());
    return str;
  }
}
