import 'dart:convert';

class ExerciseData {
  late String id;
  late String title;
  late int seconds;
  late int currentSeconds;
  late String video;
  late String description;
  late String image;
  late List<String> steps;

  ExerciseData({
    required this.id,
    required this.title,
    required this.seconds,
    this.currentSeconds = 0,
    required this.video,
    required this.description,
    required this.image,
    required this.steps,
  });

  double get progress => currentSeconds / seconds;

  bool get isFisnished => currentSeconds >= seconds;

  bool get isProgress => currentSeconds > 0 && currentSeconds < seconds;

  ExerciseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    seconds = json['seconds'];
    currentSeconds = json['currentSeconds'] ?? 0;
    video = json['video'];
    description = json['description'];
    image = json['image'];
    steps = json['steps'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['seconds'] = seconds;
    data['currentSeconds'] = currentSeconds;
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
