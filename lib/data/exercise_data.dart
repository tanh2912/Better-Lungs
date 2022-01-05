class ExerciseData {
  final String title;
  final int seconds;
  final String image;
  final double progress;
  final String video;
  final String description;
  final List<String> steps; 

  ExerciseData({
    required this.title,
    required this.seconds,
    required this.image,
    required this.progress,
    required this.video,
    required this.description,
    required this.steps,
  });

  @override
  String toString() {
    return 'ExerciseData(title: $title, seconds: $seconds, image: $image, progress: $progress, video: $video)';
  }
}
