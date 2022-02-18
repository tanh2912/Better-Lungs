import 'package:fitness_flutter/screens/workouts/widget/workout_content.dart';
import 'package:flutter/material.dart';

class WorkoutsPage extends StatelessWidget {
  const WorkoutsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildContext(context));
  }

  Widget _buildContext(BuildContext context) {
    return const WorkoutContent();
  }
}
