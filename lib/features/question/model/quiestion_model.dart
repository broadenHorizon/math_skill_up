import 'package:math_skill_up/features/home/model/question_settings_model.dart';

class Question {}

enum Operator { addition, subtraction, multiplication, division }

/// 사칙 연산 모델
class BasicOperationQuestion extends Question {
  final int id;
  final int firstNum;
  final int secondNum;
  final ArithmeticType operator;
  final double answer;

  BasicOperationQuestion(
      {required this.id,
      required this.firstNum,
      required this.secondNum,
      required this.operator,
      required this.answer});
}

/// 분수 비교 모델
class FractionOperationQuestion extends Question {
  final int id;
  final String question;
  final int answer;

  FractionOperationQuestion(
      {required this.id, required this.question, required this.answer});
}

/// 알파벳 연산 모델
class AlphabetOperationQuestion extends Question {
  final int id;
  final String question;
  final String answer;

  AlphabetOperationQuestion(
      {required this.id, required this.question, required this.answer});
}
