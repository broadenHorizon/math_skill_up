import 'package:math_skill_up/features/question_setting/model/question_setting_model.dart';

int convertQuestionCountToInt(QuestionCount count) {
  switch (count) {
    case QuestionCount.ten:
      return 10;
    case QuestionCount.twenty:
      return 20;
    case QuestionCount.thirty:
      return 30;
    case QuestionCount.forty:
      return 40;
    case QuestionCount.fifty:
      return 50;
  }
}
