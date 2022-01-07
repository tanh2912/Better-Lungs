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
        exercises: TextConstants.yogaExercises,
        seconds: TextConstants.yogaSeconds,
        currentProgress: 10,
        progress: 16,
        image: PathConstants.yoga,
        exerciseDataList: [
          ExerciseData(
            title: TextConstants.reclining,
            seconds: TextConstants.recliningSeconds,
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
            seconds: TextConstants.cowPoseSeconds,
            image: PathConstants.cowPoseImage,
            progress: 0.3,
            video: PathConstants.cowPoseVideo,
            description: TextConstants.cowPoseDescription,
            steps: [TextConstants.cowPoseStep1, TextConstants.cowPoseStep2],
          ),
          ExerciseData(
            title: TextConstants.warriorPose,
            seconds: TextConstants.warriorPoseSeconds,
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
            seconds: TextConstants.hohuuhieuSeconds,
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
            seconds: TextConstants.thochukychudongSeconds,
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
        ], id: ''),
    WorkoutData(
      title: TextConstants.fullBodyTitle,
      exercises: TextConstants.fullBodyExercises,
      seconds: TextConstants.fullBodySeconds,
      currentProgress: 12,
      progress: 14,
      image: PathConstants.fullBody,
      exerciseDataList: [
        ExerciseData(
          title: TextConstants.nangvai,
          seconds: TextConstants.nangvaiSeconds,
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
          seconds: TextConstants.gapduoikhuyutaySeconds,
          image: PathConstants.gapduoikhuyutayImage,
          progress: 0.6,
          video: PathConstants.gapduoikhuyutayVideo,
          description: TextConstants.gapduoikhuyutayDescription,
          steps: [TextConstants.gapduoikhuyutayStep1],
        ),
        ExerciseData(
          title: TextConstants.gapxoaycochan,
          seconds: TextConstants.gapxoaycochanSeconds,
          image: PathConstants.gapxoaycochanImage,
          progress: 0.8,
          video: PathConstants.gapxoaycochanVideo,
          description: TextConstants.gapxoaycochanDescription,
          steps: [TextConstants.gapxoaycochanStep1],
        ),
        ExerciseData(
          title: TextConstants.coduoichan,
          seconds: TextConstants.coduoichanSeconds,
          image: PathConstants.coduoichanImage,
          progress: 0.3,
          video: PathConstants.coduoichanVideo,
          description: TextConstants.coduoichanDescription,
          steps: [TextConstants.coduoichanStep1],
        ),
        ExerciseData(
          title: TextConstants.dangchan,
          seconds: TextConstants.dangchanSeconds,
          image: PathConstants.dangchanImage,
          progress: 0.3,
          video: PathConstants.dangchanVideo,
          description: TextConstants.dangchanDescription,
          steps: [TextConstants.dangchanStep1],
        ),
        ExerciseData(
          title: TextConstants.nangchan,
          seconds: TextConstants.nangchanSeconds,
          image: PathConstants.nangchanImage,
          progress: 0.3,
          video: PathConstants.nangchanVideo,
          description: TextConstants.nangchanDescription,
          steps: [TextConstants.nangchanStep1],
        ),
      ], id: '',
    )
  ];

  static final List<WorkoutData> homeWorkouts = [
    WorkoutData(
        title: TextConstants.cardioTitle,
        exercises: TextConstants.cardioExercises,
        seconds: TextConstants.cardioSeconds,
        currentProgress: 10,
        progress: 16,
        image: PathConstants.cardio,
        exerciseDataList: [
          ExerciseData(
            title: TextConstants.reclining,
            seconds: TextConstants.recliningSeconds,
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
            seconds: TextConstants.cowPoseSeconds,
            image: PathConstants.cowPoseImage,
            progress: 0.3,
            video: PathConstants.cowPoseVideo,
            description: TextConstants.cowPoseDescription,
            steps: [TextConstants.cowPoseStep1, TextConstants.cowPoseStep2],
          ),
          ExerciseData(
            title: TextConstants.warriorPose,
            seconds: TextConstants.warriorPoseSeconds,
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
            seconds: TextConstants.hohuuhieuSeconds,
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
            seconds: TextConstants.thochukychudongSeconds,
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
        ], id: ''),
    WorkoutData(
      title: TextConstants.armsTitle,
      exercises: TextConstants.armsExercises,
      seconds: TextConstants.armsSeconds,
      currentProgress: 1,
      progress: 20,
      image: PathConstants.arms,
      exerciseDataList: [
        ExerciseData(
          title: TextConstants.nangvai,
          seconds: TextConstants.nangvaiSeconds,
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
          seconds: TextConstants.gapduoikhuyutaySeconds,
          image: PathConstants.gapduoikhuyutayImage,
          progress: 0.6,
          video: PathConstants.gapduoikhuyutayVideo,
          description: TextConstants.gapduoikhuyutayDescription,
          steps: [TextConstants.gapduoikhuyutayStep1],
        ),
        ExerciseData(
          title: TextConstants.gapxoaycochan,
          seconds: TextConstants.gapxoaycochanSeconds,
          image: PathConstants.gapxoaycochanImage,
          progress: 0.8,
          video: PathConstants.gapxoaycochanVideo,
          description: TextConstants.gapxoaycochanDescription,
          steps: [TextConstants.gapxoaycochanStep1],
        ),
        ExerciseData(
          title: TextConstants.coduoichan,
          seconds: TextConstants.coduoichanSeconds,
          image: PathConstants.coduoichanImage,
          progress: 0.3,
          video: PathConstants.coduoichanVideo,
          description: TextConstants.coduoichanDescription,
          steps: [TextConstants.coduoichanStep1],
        ),
        ExerciseData(
          title: TextConstants.dangchan,
          seconds: TextConstants.dangchanSeconds,
          image: PathConstants.dangchanImage,
          progress: 0.3,
          video: PathConstants.dangchanVideo,
          description: TextConstants.dangchanDescription,
          steps: [TextConstants.dangchanStep1],
        ),
        ExerciseData(
          title: TextConstants.nangchan,
          seconds: TextConstants.nangchanSeconds,
          image: PathConstants.nangchanImage,
          progress: 0.3,
          video: PathConstants.nangchanVideo,
          description: TextConstants.nangchanDescription,
          steps: [TextConstants.nangchanStep1],
        ),
      ], id: '',
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
