import 'package:fitness_flutter/core/const/path_constants.dart';
import 'package:fitness_flutter/core/const/text_constants.dart';
import 'package:fitness_flutter/data/exercise_data.dart';
import 'package:fitness_flutter/data/workout_data.dart';
import 'package:fitness_flutter/screens/onboarding/onboarding_tile.dart';

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
        title: TextConstants.yogaTitle,
        exercices: TextConstants.yogaExercises,
        minutes: TextConstants.yogaMinutes,
        currentProgress: 10,
        progress: 16,
        image: PathConstants.yoga,
        exerciseDataList: [
          ExerciseData(
            title: TextConstants.reclining,
            minutes: TextConstants.recliningMinutes,
            image: PathConstants.recliningImage,
            progress: 1,
            video: PathConstants.recliningVideo,
            description: TextConstants.warriorDescription,
            steps: [
              TextConstants.recliningStep1,
              TextConstants.recliningStep2,
            ],
          ),
          ExerciseData(
            title: TextConstants.cowPose,
            minutes: TextConstants.cowPoseMinutes,
            image: PathConstants.cowPoseImage,
            progress: 0.3,
            video: PathConstants.cowPoseVideo,
            description: TextConstants.cowPoseDescription,
            steps: [TextConstants.cowPoseStep1, TextConstants.cowPoseStep2],
          ),
          ExerciseData(
            title: TextConstants.warriorPose,
            minutes: TextConstants.warriorPoseMinutes,
            image: PathConstants.warriorPoseImage,
            progress: 0.99,
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
            title: TextConstants.hohuuhieu,
            minutes: TextConstants.hohuuhieuMinutes,
            image: PathConstants.hohuuhieuImage,
            progress: 0.3,
            video: PathConstants.hohuuhieuVideo,
            description: TextConstants.hohuuhieuDescription,
            steps: [
              TextConstants.hohuuhieuStep1,
              TextConstants.hohuuhieuStep2,
              TextConstants.hohuuhieuStep3
            ],
          ),
          ExerciseData(
            title: TextConstants.thochukychudong,
            minutes: TextConstants.thochukychudongMinutes,
            image: PathConstants.thochukychudongImage,
            progress: 0.3,
            video: PathConstants.thochukychudongVideo,
            description: TextConstants.thochukychudongDescription,
            steps: [
              TextConstants.thochukychudongStep1,
              TextConstants.thochukychudongStep2,
              TextConstants.thochukychudongStep3
            ],
          )
        ]),
    WorkoutData(
      title: TextConstants.fullBodyTitle,
      exercices: TextConstants.fullBodyExercises,
      minutes: TextConstants.fullBodyMinutes,
      currentProgress: 12,
      progress: 14,
      image: PathConstants.fullBody,
      exerciseDataList: [
        ExerciseData(
          title: TextConstants.nangvai,
          minutes: TextConstants.nangvaiMinutes,
          image: PathConstants.nangvaiImage,
          progress: 0.99,
          video: PathConstants.nangvaiVideo,
          description: TextConstants.nangvaiDescription,
          steps: [
            TextConstants.nangvaiStep1,
          ],
        ),
        ExerciseData(
          title: TextConstants.gapduoikhuyutay,
          minutes: TextConstants.gapduoikhuyutayMinutes,
          image: PathConstants.gapduoikhuyutayImage,
          progress: 0.6,
          video: PathConstants.gapduoikhuyutayVideo,
          description: TextConstants.gapduoikhuyutayDescription,
          steps: [TextConstants.gapduoikhuyutayStep1],
        ),
        ExerciseData(
          title: TextConstants.gapxoaycochan,
          minutes: TextConstants.gapxoaycochanMinutes,
          image: PathConstants.gapxoaycochanImage,
          progress: 0.8,
          video: PathConstants.gapxoaycochanVideo,
          description: TextConstants.gapxoaycochanDescription,
          steps: [TextConstants.gapxoaycochanStep1],
        ),
        ExerciseData(
          title: TextConstants.coduoichan,
          minutes: TextConstants.coduoichanMinutes,
          image: PathConstants.coduoichanImage,
          progress: 0.3,
          video: PathConstants.coduoichanVideo,
          description: TextConstants.coduoichanDescription,
          steps: [TextConstants.coduoichanStep1],
        ),
        ExerciseData(
          title: TextConstants.dangchan,
          minutes: TextConstants.dangchanMinutes,
          image: PathConstants.dangchanImage,
          progress: 0.3,
          video: PathConstants.dangchanVideo,
          description: TextConstants.dangchanDescription,
          steps: [TextConstants.dangchanStep1],
        ),
        ExerciseData(
          title: TextConstants.nangchan,
          minutes: TextConstants.nangchanMinutes,
          image: PathConstants.nangchanImage,
          progress: 0.3,
          video: PathConstants.nangchanVideo,
          description: TextConstants.nangchanDescription,
          steps: [TextConstants.nangchanStep1],
        ),
      ],
    )
  ];

  static final List<WorkoutData> homeWorkouts = [
    WorkoutData(
        title: TextConstants.cardioTitle,
        exercices: TextConstants.cardioExercises,
        minutes: TextConstants.cardioMinutes,
        currentProgress: 10,
        progress: 16,
        image: PathConstants.cardio,
        exerciseDataList: [
          ExerciseData(
            title: TextConstants.reclining,
            minutes: TextConstants.recliningMinutes,
            image: PathConstants.recliningImage,
            progress: 1,
            video: PathConstants.recliningVideo,
            description: TextConstants.warriorDescription,
            steps: [
              TextConstants.recliningStep1,
              TextConstants.recliningStep2,
            ],
          ),
          ExerciseData(
            title: TextConstants.cowPose,
            minutes: TextConstants.cowPoseMinutes,
            image: PathConstants.cowPoseImage,
            progress: 0.3,
            video: PathConstants.cowPoseVideo,
            description: TextConstants.cowPoseDescription,
            steps: [TextConstants.cowPoseStep1, TextConstants.cowPoseStep2],
          ),
          ExerciseData(
            title: TextConstants.warriorPose,
            minutes: TextConstants.warriorPoseMinutes,
            image: PathConstants.warriorPoseImage,
            progress: 0.99,
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
            title: TextConstants.hohuuhieu,
            minutes: TextConstants.hohuuhieuMinutes,
            image: PathConstants.hohuuhieuImage,
            progress: 0.3,
            video: PathConstants.hohuuhieuVideo,
            description: TextConstants.hohuuhieuDescription,
            steps: [
              TextConstants.hohuuhieuStep1,
              TextConstants.hohuuhieuStep2,
              TextConstants.hohuuhieuStep3
            ],
          ),
          ExerciseData(
            title: TextConstants.thochukychudong,
            minutes: TextConstants.thochukychudongMinutes,
            image: PathConstants.thochukychudongImage,
            progress: 0.3,
            video: PathConstants.thochukychudongVideo,
            description: TextConstants.thochukychudongDescription,
            steps: [
              TextConstants.thochukychudongStep1,
              TextConstants.thochukychudongStep2,
              TextConstants.thochukychudongStep3
            ],
          )
        ]),
    WorkoutData(
      title: TextConstants.armsTitle,
      exercices: TextConstants.armsExercises,
      minutes: TextConstants.armsMinutes,
      currentProgress: 1,
      progress: 20,
      image: PathConstants.arms,
      exerciseDataList: [
        ExerciseData(
          title: TextConstants.nangvai,
          minutes: TextConstants.nangvaiMinutes,
          image: PathConstants.nangvaiImage,
          progress: 0.99,
          video: PathConstants.nangvaiVideo,
          description: TextConstants.nangvaiDescription,
          steps: [
            TextConstants.nangvaiStep1,
          ],
        ),
        ExerciseData(
          title: TextConstants.gapduoikhuyutay,
          minutes: TextConstants.gapduoikhuyutayMinutes,
          image: PathConstants.gapduoikhuyutayImage,
          progress: 0.6,
          video: PathConstants.gapduoikhuyutayVideo,
          description: TextConstants.gapduoikhuyutayDescription,
          steps: [TextConstants.gapduoikhuyutayStep1],
        ),
        ExerciseData(
          title: TextConstants.gapxoaycochan,
          minutes: TextConstants.gapxoaycochanMinutes,
          image: PathConstants.gapxoaycochanImage,
          progress: 0.8,
          video: PathConstants.gapxoaycochanVideo,
          description: TextConstants.gapxoaycochanDescription,
          steps: [TextConstants.gapxoaycochanStep1],
        ),
        ExerciseData(
          title: TextConstants.coduoichan,
          minutes: TextConstants.coduoichanMinutes,
          image: PathConstants.coduoichanImage,
          progress: 0.3,
          video: PathConstants.coduoichanVideo,
          description: TextConstants.coduoichanDescription,
          steps: [TextConstants.coduoichanStep1],
        ),
        ExerciseData(
          title: TextConstants.dangchan,
          minutes: TextConstants.dangchanMinutes,
          image: PathConstants.dangchanImage,
          progress: 0.3,
          video: PathConstants.dangchanVideo,
          description: TextConstants.dangchanDescription,
          steps: [TextConstants.dangchanStep1],
        ),
        ExerciseData(
          title: TextConstants.nangchan,
          minutes: TextConstants.nangchanMinutes,
          image: PathConstants.nangchanImage,
          progress: 0.3,
          video: PathConstants.nangchanVideo,
          description: TextConstants.nangchanDescription,
          steps: [TextConstants.nangchanStep1],
        ),
      ],
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
