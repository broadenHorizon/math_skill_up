import 'package:math_skill_up/features/home/model/question_setting_model.dart';

abstract class QuestionSettingRepository {
  Future<QuestionSettingModel?> build(); // 설정 불러오기
  Future<void> save(QuestionSettingModel settings); // 설정 저장
}
