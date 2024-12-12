import 'package:math_skill_up/features/home/model/question_settings_model.dart';
import 'package:math_skill_up/features/question/util/basic_operation_util.dart';

ArithmeticType generateRandomOperator() {
  int randomNum = generateRandomInt(minNum: 0, maxNum: 1);
  return randomNum == 0 ? ArithmeticType.addition : ArithmeticType.subtraction;
}
