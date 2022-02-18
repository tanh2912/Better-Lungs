import 'package:fitness_flutter/core/const/text_constants.dart';
import 'package:fitness_flutter/data/exercise_data.dart';
import 'package:fitness_flutter/data/workout_data.dart';
import 'package:fitness_flutter/screens/common_widgets/fitness_button.dart';
import 'package:fitness_flutter/screens/home/bloc/home_bloc.dart';
import 'package:fitness_flutter/screens/start_workout/page/start_workout_page.dart';
import 'package:fitness_flutter/screens/workout_details_screen/bloc/workout_details_bloc.dart';
import 'package:fitness_flutter/screens/workout_details_screen/widget/workout_details_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitness_flutter/core/extensions/list_extension.dart';

class WorkoutDetailsPage extends StatelessWidget {
  final WorkoutData workout;

  const WorkoutDetailsPage({Key? key, required this.workout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildContext(context);
  }

  BlocProvider<WorkoutDetailsBloc> _buildContext(BuildContext context) {
    return BlocProvider<WorkoutDetailsBloc>(
      create: (context) => WorkoutDetailsBloc(
          workout: workout, homeBloc: BlocProvider.of<HomeBloc>(context)),
      child: BlocConsumer<WorkoutDetailsBloc, WorkoutDetailsState>(
        buildWhen: (_, currState) =>
            currState is WorkoutDetailsInitial ||
            currState is WorkoutExcerciseUserPracticeState,
        builder: (context, state) {
          return Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: FitnessButton(
                  title: TextConstants.start,
                  onTap: () {
                    ExerciseData? exercise = workout.exerciseDataList
                        .firstWhereOrNull((element) =>
                            element.currentSeconds < element.seconds);
                    exercise ??= workout.exerciseDataList.first;
                    int exerciseIndex =
                        workout.exerciseDataList.indexOf(exercise);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                                value: BlocProvider.of<WorkoutDetailsBloc>(
                                    context),
                                child: StartWorkoutPage(
                                  exercise: exercise!,
                                  currentExercise: exercise,
                                  nextExercise: exerciseIndex + 1 <
                                          workout.exerciseDataList.length
                                      ? workout
                                          .exerciseDataList[exerciseIndex + 1]
                                      : null,
                                ),
                              )),
                    );
                  },
                ),
              ),
              body: WorkoutDetailsContent(workout: workout));
        },
        listenWhen: (_, currState) =>
            currState is BackTappedState ||
            currState is WorkoutExerciseCellTappedState,
        listener: (context, state) {
          if (state is BackTappedState) {
            Navigator.pop(context);
          } else if (state is WorkoutExerciseCellTappedState) {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                        value: BlocProvider.of<WorkoutDetailsBloc>(context),
                        child: StartWorkoutPage(
                          exercise: state.currentExercise,
                          currentExercise: state.currentExercise,
                          nextExercise: state.nextExercise,
                        ),
                      )),
            );
          }
        },
      ),
    );
  }
}
