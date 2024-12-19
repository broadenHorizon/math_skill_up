import 'package:math_skill_up/features/question/util/basic_operation_util.dart';
import 'package:math_skill_up/features/question_setting/model/question_setting_model.dart';

ArithmeticType generateRandomOperator() {
  int randomNum = generateRandomInt(minNum: 0, maxNum: 1);
  return randomNum == 0 ? ArithmeticType.addition : ArithmeticType.subtraction;
}
