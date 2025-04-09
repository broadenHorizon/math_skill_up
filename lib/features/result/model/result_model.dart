import 'package:math_skill_up/features/question/model/quiestion_model.dart';

class Result {
  bool isCorrect;
  double time; // 초 단위 (ex. 1.5s -> 1.5초)

  Result({
    required this.isCorrect,
    required this.time,
  });
}

class FractionResult extends Result {
  FractionOperationAnswer? userAnswer;
  final FractionOperationQuestion question;

  FractionResult({
    required this.userAnswer,
    required super.isCorrect,
    required super.time,
    required this.question,
  });
}

class BasicResult extends Result {
  double? userAnswer;
  final BasicOperationQuestion question;

  BasicResult({
    required this.userAnswer,
    required super.isCorrect,
    required super.time,
    required this.question,
  });
}

class AlphabetResult extends Result {
  String? userAnswer;
  final AlphabetOperationQuestion question;

  AlphabetResult({
    required this.userAnswer,
    required super.isCorrect,
    required super.time,
    required this.question,
  });
}

class ResultSummary {
  double totalTime;
  double averageTime;
  double timeChange;
  int totalQuestions;
  int correctQuestions;
  double averageAccuracy;
  double accuracyChange;

  ResultSummary({
    required this.totalTime,
    required this.averageTime,
    required this.timeChange,
    required this.totalQuestions,
    required this.correctQuestions,
    required this.averageAccuracy,
    required this.accuracyChange,
  });
}
