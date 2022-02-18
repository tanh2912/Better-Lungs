import 'package:fitness_flutter/core/const/path_constants.dart';
import 'package:fitness_flutter/core/const/text_constants.dart';
import 'package:fitness_flutter/data/workout_data.dart';
import 'package:fitness_flutter/screens/workout_details_screen/widget/panel/exercises_list.dart';
import 'package:fitness_flutter/screens/workout_details_screen/widget/panel/workout_tag.dart';
import 'package:flutter/material.dart';

class WorkoutDetailsPanel extends StatelessWidget {
  final WorkoutData workout;

  const WorkoutDetailsPanel({Key? key, required this.workout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _createPanelData(context);
  }

  Widget _createPanelData(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        _createRectangle(),
        const SizedBox(height: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _createHeader(),
              const SizedBox(height: 20),
              _createWorkoutData(context),
              const SizedBox(height: 20),
              _createExerciesList(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _createRectangle() {
    return const Image(image: AssetImage(PathConstants.rectangle));
  }

  Widget _createHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        workout.title + "  " + TextConstants.workout,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _createWorkoutData(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          WorkoutTag(
            icon: PathConstants.timeTracker,
            content: "${_getExerciseTime() } giây",
          ),
          const SizedBox(width: 15),
          WorkoutTag(
            icon: PathConstants.exerciseTracker,
            content:
                '${workout.exerciseDataList.length} bài tập',
          ),
        ],
      ),
    );
  }

  Widget _createExerciesList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ExercisesList(
            exercises: workout.exerciseDataList, workout: workout),
      ),
    );
  }

  int _getExerciseTime() {
    int time = 0;
    final List<int?> exerciseList =
        workout.exerciseDataList.map((e) => e.seconds).toList();
    for (var e in exerciseList) {
      time += e!;
    }
    return time;
  }
}
