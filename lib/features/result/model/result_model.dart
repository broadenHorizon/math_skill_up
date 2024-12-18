import 'package:math_skill_up/features/question/model/quiestion_model.dart';

class Result {}

class FractionResult extends Result {
  final FractionOperationAnswer userAnswer;
  final bool isCorrect;
  final double time; // 초 단위 (ex. 1.5s -> 1.5초)
  final FractionOperationQuestion question;

  FractionResult({
    required this.userAnswer,
    required this.isCorrect,
    required this.time,
    required this.question,
  });
}

class BasicResult extends Result {
  final double userAnswer;
  final bool isCorrect;
  final double time; // 초 단위 (ex. 1.5s -> 1.5초)
  final BasicOperationQuestion question;

  BasicResult({
    required this.userAnswer,
    required this.isCorrect,
    required this.time,
    required this.question,
  });
}

class AlphabetResult extends Result {
  final String userAnswer;
  final bool isCorrect;
  final double time; // 초 단위 (ex. 1.5s -> 1.5초)
  final AlphabetOperationQuestion question;

  AlphabetResult({
    required this.userAnswer,
    required this.isCorrect,
    required this.time,
    required this.question,
  });
}
