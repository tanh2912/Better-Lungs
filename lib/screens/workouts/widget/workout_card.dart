// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:fitness_flutter/core/const/text_constants.dart';
import 'package:fitness_flutter/data/workout_data.dart';
import 'package:fitness_flutter/screens/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../workout_details_screen/page/workout_details_page.dart';

class WorkoutCard extends StatelessWidget {
  final WorkoutData workout;

  WorkoutCard({Key? key, required this.workout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorConstants.white,
        boxShadow: [
          BoxShadow(
              color: ColorConstants.textBlack.withOpacity(0.12),
              blurRadius: 5.0,
              spreadRadius: 1.1)
        ],
      ),
      child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                      value: BlocProvider.of<HomeBloc>(context),
                      child: WorkoutDetailsPage(workout: workout),
                    ))),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(workout.title,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 3),
                        Text(
                            '${workout.exerciseDataList.length} bài tập',
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: ColorConstants.grey),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2),
                        const SizedBox(height: 3),
                        Text(
                            '${_getWorkoutSeconds()}' " " +
                                TextConstants.seconds,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: ColorConstants.grey),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2),
                        const Spacer(),
                        Text(
                            '${workout.totalFinished}/${workout.totalExercises}',
                            style: const TextStyle(fontSize: 10)),
                        Text(
                            '${workout.totalSecondsInprogress()} giây - ${workout.getProgressPercentage()}%',
                            style: const TextStyle(fontSize: 10)),
                        const SizedBox(height: 3),
                        Padding(
                          padding: const EdgeInsets.only(right: 30.0, left: 2),
                          child: LinearPercentIndicator(
                            percent: workout.totalSecondsInprogress() /
                                workout.totalSeconds(),
                            progressColor: ColorConstants.primaryColor,
                            backgroundColor:
                                ColorConstants.primaryColor.withOpacity(0.12),
                            lineHeight: 8,
                            padding: EdgeInsets.zero,
                            alignment: MainAxisAlignment.center,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 60),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(workout.image, fit: BoxFit.fill),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  int _getWorkoutSeconds() {
    var seconds = 0;
    final secondsList = workout.exerciseDataList.map((e) => e.seconds).toList();
    for (var e in secondsList) {
      seconds += e;
    }
    return seconds;
  }
}
