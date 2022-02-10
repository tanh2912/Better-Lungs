import 'package:fitness_flutter/core/const/path_constants.dart';
import 'package:fitness_flutter/core/const/text_constants.dart';
import 'package:fitness_flutter/data/exercise_data.dart';
import 'package:fitness_flutter/data/workout_data.dart';
import 'package:fitness_flutter/screens/onboarding/onboarding_tile.dart';
import 'package:flutter/material.dart';

import 'color_constants.dart';

class DataConstants {
  // Onboarding
  static final onboardingTiles = [
    const OnboardingTile(
      title: TextConstants.onboarding1Title,
      mainText: TextConstants.onboarding1Description,
      imagePath: PathConstants.onboarding1,
    ),
    const OnboardingTile(
      title: TextConstants.onboarding2Title,
      mainText: TextConstants.onboarding2Description,
      imagePath: PathConstants.onboarding2,
    ),
    const OnboardingTile(
      title: TextConstants.onboarding3Title,
      mainText: TextConstants.onboarding3Description,
      imagePath: PathConstants.onboarding3,
    ),
  ];

  // Workouts
  static final List<WorkoutData> workouts = [
    WorkoutData(
        color: ColorConstants.cardioColor,
        title: TextConstants.yogaTitle,
        image: PathConstants.yoga,
        exerciseDataList: [
          ExerciseData(
            id: "reclining",
            title: TextConstants.reclining,
            seconds: TextConstants.recliningSeconds,
            image: PathConstants.recliningImage,
            video: PathConstants.recliningVideo,
            description: TextConstants.warriorDescription,
            steps: [
              TextConstants.recliningStep1,
              TextConstants.recliningStep2,
            ],
          ),
          ExerciseData(
            id: "cowPose",
            title: TextConstants.cowPose,
            seconds: TextConstants.cowPoseSeconds,
            image: PathConstants.cowPoseImage,
            video: PathConstants.cowPoseVideo,
            description: TextConstants.cowPoseDescription,
            steps: [TextConstants.cowPoseStep1, TextConstants.cowPoseStep2],
          ),
          ExerciseData(
            id: "warriorPose",
            title: TextConstants.warriorPose,
            seconds: TextConstants.warriorPoseSeconds,
            image: PathConstants.warriorPoseImage,
            // progress: 0.99,
            video: PathConstants.warriorIIVideo,
            description: TextConstants.warriorDescription,
            steps: [
              TextConstants.warriorStep1,
              TextConstants.warriorStep2,
              TextConstants.warriorStep3,
              TextConstants.warriorStep4
            ],
          ),
          ExerciseData(
            id: "hohuuhieu",
            title: TextConstants.hohuuhieu,
            seconds: TextConstants.hohuuhieuSeconds,
            image: PathConstants.hohuuhieuImage,
            video: PathConstants.hohuuhieuVideo,
            description: TextConstants.hohuuhieuDescription,
            steps: [
              TextConstants.hohuuhieuStep1,
              TextConstants.hohuuhieuStep2,
              TextConstants.hohuuhieuStep3
            ],
          ),
          ExerciseData(
            id: "thochukychudong",
            title: TextConstants.thochukychudong,
            seconds: TextConstants.thochukychudongSeconds,
            image: PathConstants.thochukychudongImage,
            video: PathConstants.thochukychudongVideo,
            description: TextConstants.thochukychudongDescription,
            steps: [
              TextConstants.thochukychudongStep1,
              TextConstants.thochukychudongStep2,
              TextConstants.thochukychudongStep3
            ],
          )
        ],
        id: 'yoga'),
    WorkoutData(
      color: ColorConstants.armsColor,
      title: TextConstants.fullBodyTitle,
      image: PathConstants.fullBody,
      exerciseDataList: [
        ExerciseData(
          id: "nangvai",
          title: TextConstants.nangvai,
          seconds: TextConstants.nangvaiSeconds,
          image: PathConstants.nangvaiImage,
          video: PathConstants.nangvaiVideo,
          description: TextConstants.nangvaiDescription,
          steps: [
            TextConstants.nangvaiStep1,
          ],
        ),
        ExerciseData(
          id: "gapduoikhuyutay",
          title: TextConstants.gapduoikhuyutay,
          seconds: TextConstants.gapduoikhuyutaySeconds,
          image: PathConstants.gapduoikhuyutayImage,
          video: PathConstants.gapduoikhuyutayVideo,
          description: TextConstants.gapduoikhuyutayDescription,
          steps: [TextConstants.gapduoikhuyutayStep1],
        ),
        ExerciseData(
          id: "gapxoaycochan",
          title: TextConstants.gapxoaycochan,
          seconds: TextConstants.gapxoaycochanSeconds,
          image: PathConstants.gapxoaycochanImage,
          video: PathConstants.gapxoaycochanVideo,
          description: TextConstants.gapxoaycochanDescription,
          steps: [TextConstants.gapxoaycochanStep1],
        ),
        ExerciseData(
          id: "coduoichan",
          title: TextConstants.coduoichan,
          seconds: TextConstants.coduoichanSeconds,
          image: PathConstants.coduoichanImage,
          video: PathConstants.coduoichanVideo,
          description: TextConstants.coduoichanDescription,
          steps: [TextConstants.coduoichanStep1],
        ),
        ExerciseData(
          id: "dangchan",
          title: TextConstants.dangchan,
          seconds: TextConstants.dangchanSeconds,
          image: PathConstants.dangchanImage,
          video: PathConstants.dangchanVideo,
          description: TextConstants.dangchanDescription,
          steps: [TextConstants.dangchanStep1],
        ),
        ExerciseData(
          id: "nangchan",
          title: TextConstants.nangchan,
          seconds: TextConstants.nangchanSeconds,
          image: PathConstants.nangchanImage,
          video: PathConstants.nangchanVideo,
          description: TextConstants.nangchanDescription,
          steps: [TextConstants.nangchanStep1],
        ),
      ],
      id: 'fullBody',
    )
  ];

  static final List<WorkoutData> homeWorkouts = [
    WorkoutData(
        color: Colors.black,
        title: TextConstants.cardioTitle,
        image: PathConstants.cardio,
        exerciseDataList: [
          ExerciseData(
            id: "home_reclining",
            title: TextConstants.reclining,
            seconds: TextConstants.recliningSeconds,
            image: PathConstants.recliningImage,
            video: PathConstants.recliningVideo,
            description: TextConstants.warriorDescription,
            steps: [
              TextConstants.recliningStep1,
              TextConstants.recliningStep2,
            ],
          ),
          ExerciseData(
            id: "home_cowPose",
            title: TextConstants.cowPose,
            seconds: TextConstants.cowPoseSeconds,
            image: PathConstants.cowPoseImage,
            video: PathConstants.cowPoseVideo,
            description: TextConstants.cowPoseDescription,
            steps: [TextConstants.cowPoseStep1, TextConstants.cowPoseStep2],
          ),
          ExerciseData(
            id: "",
            title: TextConstants.warriorPose,
            seconds: TextConstants.warriorPoseSeconds,
            image: PathConstants.warriorPoseImage,
            video: PathConstants.warriorIIVideo,
            description: TextConstants.warriorDescription,
            steps: [
              TextConstants.warriorStep1,
              TextConstants.warriorStep2,
              TextConstants.warriorStep3,
              TextConstants.warriorStep4
            ],
          ),
          ExerciseData(
            id: "",
            title: TextConstants.hohuuhieu,
            seconds: TextConstants.hohuuhieuSeconds,
            image: PathConstants.hohuuhieuImage,
            video: PathConstants.hohuuhieuVideo,
            description: TextConstants.hohuuhieuDescription,
            steps: [
              TextConstants.hohuuhieuStep1,
              TextConstants.hohuuhieuStep2,
              TextConstants.hohuuhieuStep3
            ],
          ),
          ExerciseData(
            id: "",
            title: TextConstants.thochukychudong,
            seconds: TextConstants.thochukychudongSeconds,
            image: PathConstants.thochukychudongImage,
            video: PathConstants.thochukychudongVideo,
            description: TextConstants.thochukychudongDescription,
            steps: [
              TextConstants.thochukychudongStep1,
              TextConstants.thochukychudongStep2,
              TextConstants.thochukychudongStep3
            ],
          )
        ],
        id: 'cardio'),
    WorkoutData(
      color: Colors.black,
      title: TextConstants.armsTitle,
      image: PathConstants.arms,
      exerciseDataList: [
        ExerciseData(
          id: "",
          title: TextConstants.nangvai,
          seconds: TextConstants.nangvaiSeconds,
          image: PathConstants.nangvaiImage,
          video: PathConstants.nangvaiVideo,
          description: TextConstants.nangvaiDescription,
          steps: [
            TextConstants.nangvaiStep1,
          ],
        ),
        ExerciseData(
          id: "",
          title: TextConstants.gapduoikhuyutay,
          seconds: TextConstants.gapduoikhuyutaySeconds,
          image: PathConstants.gapduoikhuyutayImage,
          video: PathConstants.gapduoikhuyutayVideo,
          description: TextConstants.gapduoikhuyutayDescription,
          steps: [TextConstants.gapduoikhuyutayStep1],
        ),
        ExerciseData(
          id: "",
          title: TextConstants.gapxoaycochan,
          seconds: TextConstants.gapxoaycochanSeconds,
          image: PathConstants.gapxoaycochanImage,
          video: PathConstants.gapxoaycochanVideo,
          description: TextConstants.gapxoaycochanDescription,
          steps: [TextConstants.gapxoaycochanStep1],
        ),
        ExerciseData(
          id: "",
          title: TextConstants.coduoichan,
          seconds: TextConstants.coduoichanSeconds,
          image: PathConstants.coduoichanImage,
          video: PathConstants.coduoichanVideo,
          description: TextConstants.coduoichanDescription,
          steps: [TextConstants.coduoichanStep1],
        ),
        ExerciseData(
          id: "",
          title: TextConstants.dangchan,
          seconds: TextConstants.dangchanSeconds,
          image: PathConstants.dangchanImage,
          video: PathConstants.dangchanVideo,
          description: TextConstants.dangchanDescription,
          steps: [TextConstants.dangchanStep1],
        ),
        ExerciseData(
          id: "",
          title: TextConstants.nangchan,
          seconds: TextConstants.nangchanSeconds,
          image: PathConstants.nangchanImage,
          video: PathConstants.nangchanVideo,
          description: TextConstants.nangchanDescription,
          steps: [TextConstants.nangchanStep1],
        ),
      ],
      id: 'arms',
    )
  ];

  // Reminder
  static List<String> reminderDays = [
    TextConstants.everyday,
    TextConstants.monday_friday,
    TextConstants.weekends,
    TextConstants.monday,
    TextConstants.tuesday,
    TextConstants.wednesday,
    TextConstants.thursday,
    TextConstants.friday,
    TextConstants.saturday,
    TextConstants.sunday,
  ];
}
