import 'package:math_skill_up/features/home/model/question_settings_model.dart';

class Question {}

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

class Fraction {
  final int numerator; // 분자
  final int denominator; // 분모

  Fraction({
    required this.numerator,
    required this.denominator,
  }) {
    if (denominator == 0) {
      throw ArgumentError('Denominator cannot be zero.');
    }
  }

  /// 퍼센트 값 계산
  double get percent {
    final rawValue = numerator / denominator * 100;
    return double.parse(rawValue.toStringAsFixed(4)); // 소수점 4자리까지만 (그 밑은 버림)
  }

  double get value => numerator / denominator;
}

enum FractionOperationAnswer { first, second }

class FractionOperationQuestion extends Question {
  final int id;
  final FractionType type;
  final Fraction firstFraction;
  final Fraction secondFraction;
  final FractionOperationAnswer biggerFraction;

  FractionOperationQuestion(
      {required this.id,
      required this.type,
      required this.firstFraction,
      required this.secondFraction,
      required this.biggerFraction});
}

/// 알파벳 연산 모델
class AlphabetOperationQuestion extends Question {
  final int id;
  final String? firstAlphabet;
  final ArithmeticType operator;
  final int? secondNumber;
  final String? resultAlphabet;
  final String answer;

  AlphabetOperationQuestion(
      {required this.id,
      required this.firstAlphabet,
      required this.operator,
      required this.secondNumber,
      required this.resultAlphabet,
      required this.answer});
}
