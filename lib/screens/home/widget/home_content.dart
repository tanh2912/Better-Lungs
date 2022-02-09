// ignore_for_file: unnecessary_const

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:fitness_flutter/core/const/data_constants.dart';
import 'package:fitness_flutter/core/const/path_constants.dart';
import 'package:fitness_flutter/core/const/text_constants.dart';
import 'package:fitness_flutter/data/workout_data.dart';
import 'package:fitness_flutter/screens/edit_account/edit_account_screen.dart';
import 'package:fitness_flutter/screens/home/bloc/home_bloc.dart';
import 'package:fitness_flutter/screens/home/page/pdf_page.dart';
import 'package:fitness_flutter/screens/home/widget/home_exercises_card.dart';
import 'package:fitness_flutter/screens/home/widget/home_statistics.dart';
import 'package:fitness_flutter/screens/workout_details_screen/page/workout_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeContent extends StatelessWidget {
  final List<WorkoutData> workouts;

  const HomeContent({
    required this.workouts,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.homeBackgroundColor,
      height: double.infinity,
      width: double.infinity,
      child: _createHomeBody(context),
    );
  }

  Widget _createHomeBody(BuildContext context) {
    final bloc = BlocProvider.of<HomeBloc>(context);
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          _createProfileData(context),
          const SizedBox(height: 35),
          const HomeStatistics(),
          const SizedBox(height: 30),
          _createExercisesList(context, workouts),
          const SizedBox(height: 25),
          _createProgress(bloc),
          _createPdfList(context)
        ],
      ),
    );
  }

  Widget _createPdfList(BuildContext context) {
    const String pdf1 = 'assets/PDFfiles/chamsoc.pdf';
    const String pdf2 = 'assets/PDFfiles/quyetdinh.pdf';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Thông tin cần biết',
            style: TextStyle(
              color: ColorConstants.textBlack,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => PdfPage(pdf1)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorConstants.white,
                        boxShadow: [
                          BoxShadow(
                            color: ColorConstants.textBlack.withOpacity(0.12),
                            blurRadius: 5.0,
                            spreadRadius: 1.1,
                          ),
                        ],
                      ),
                      child: const Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Center(child: const Text('chamsoc.pdf')),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => PdfPage(pdf2)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorConstants.white,
                        boxShadow: [
                          BoxShadow(
                            color: ColorConstants.textBlack.withOpacity(0.12),
                            blurRadius: 5.0,
                            spreadRadius: 1.1,
                          ),
                        ],
                      ),
                      child: const Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Center(child: const Text('quyetdinh.pdf')),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _createProfileData(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final displayName = user?.displayName ?? "No Username";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, $displayName',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  TextConstants.checkActivity,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (_, currState) => currState is ReloadImageState,
              builder: (context, state) {
                final photoUrl = FirebaseAuth.instance.currentUser?.photoURL;
                return GestureDetector(
                  child: photoUrl == null
                      ? const CircleAvatar(
                          backgroundImage: AssetImage(PathConstants.profile),
                          radius: 60)
                      : CircleAvatar(
                          child: ClipOval(
                              child: FadeInImage.assetNetwork(
                            placeholder: PathConstants.profile,
                            image: photoUrl,
                            fit: BoxFit.cover,
                          )),
                          radius: 25),
                  onTap: () async {
                    await Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const EditAccountScreen()));
                    BlocProvider.of<HomeBloc>(context).add(ReloadImageEvent());
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget _createProgress(HomeBloc bloc) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 20),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: ColorConstants.white,
      boxShadow: [
        BoxShadow(
          color: ColorConstants.textBlack.withOpacity(0.12),
          blurRadius: 5.0,
          spreadRadius: 1.1,
        ),
      ],
    ),
    child: Row(
      children: [
        const Image(image: AssetImage(PathConstants.progress)),
        const SizedBox(width: 20),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(TextConstants.keepProgress,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 3),
              Text(
                '${TextConstants.profileSuccessful}: ${bloc.getProgressPercentage()}% tiến độ bài tập.',
                style: const TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _createExercisesList(BuildContext context, List<WorkoutData> workouts) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          TextConstants.discoverWorkouts,
          style: TextStyle(
            color: ColorConstants.textBlack,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const SizedBox(height: 15),
      SizedBox(
        height: 160,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            const SizedBox(width: 20),
            ...workouts.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 20, right: 20),
                child: WorkoutCard(
                    color: item.color,
                    workout: item,
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                              value: BlocProvider.of<HomeBloc>(context),
                              child: WorkoutDetailsPage(workout: item),
                            )))),
              ),
            )
          ],
        ),
      ),
    ],
  );
}
