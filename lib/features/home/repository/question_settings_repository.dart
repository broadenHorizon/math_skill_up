import 'package:math_skill_up/features/home/model/question_settings_model.dart';

abstract class QuestionSettingsRepository {
  Future<QuestionSettingsModel?> build(); // 설정 불러오기
  Future<void> saveSettings(QuestionSettingsModel settings); // 설정 저장
}
