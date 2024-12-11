import 'package:math_skill_up/features/question_setting/model/question_setting_model.dart';

const String historyBoxKey = 'history';

final QuestionSettingModel initialSetting = QuestionSettingModel(
  questionType: QuestionType.arithmetic,
  questionCount: QuestionCount.ten,
  arithmeticType: ArithmeticType.addition,
  digitCount: DigitCount.one,
);
