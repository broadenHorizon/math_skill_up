import 'package:hive/hive.dart';

part 'question_settings_model.g.dart';

// 문제 유형 enum
@HiveType(typeId: 2)
enum QuestionType {
  @HiveField(0)
  arithmetic, // 사칙연산
  @HiveField(1)
  fraction, // 분수
  @HiveField(2)
  alphabet, // 알파벳
}

// 문항 수 enum
@HiveType(typeId: 3)
enum QuestionCount {
  @HiveField(0)
  ten, // 10 문항
  @HiveField(1)
  twenty, // 20 문항
  @HiveField(2)
  thirty, // 30 문항
  @HiveField(3)
  forty, // 40 문항
  @HiveField(4)
  fifty, // 50 문항
}

// 사칙연산 유형 enum
@HiveType(typeId: 4)
enum ArithmeticType {
  @HiveField(0)
  addition, // 덧셈
  @HiveField(1)
  subtraction, // 뺄셈
  @HiveField(2)
  multiplication, // 곱셈
  @HiveField(3)
  division, // 나눗셈
}

// 사칙연산 자리수 enum
@HiveType(typeId: 5)
enum DigitCount {
  @HiveField(0)
  ten, // 10 자리
  @HiveField(1)
  twenty, // 20 자리
  @HiveField(2)
  thirty, // 30 자리
  @HiveField(3)
  forty, // 40 자리
  @HiveField(4)
  fifty, // 50 자리
}

// 분수 세부 유형 enum
@HiveType(typeId: 6)
enum FractionType {
  @HiveField(0)
  fraction, // 분수
  @HiveField(1)
  percent, // 퍼센트
}

// 문제 모델
@HiveType(typeId: 7)
class QuestionSettingsModel {
  @HiveField(0)
  final QuestionType problemType; // 문제 유형
  @HiveField(1)
  final QuestionCount questionCount; // 문항 수
  @HiveField(2)
  final ArithmeticType? arithmeticType; // 사칙연산 유형 (nullable)
  @HiveField(3)
  final DigitCount? digitCount; // 사칙연산 자리수 (nullable)
  @HiveField(4)
  final FractionType? fractionType; // 분수 세부 유형 (nullable)

  QuestionSettingsModel({
    required this.problemType,
    required this.questionCount,
    this.arithmeticType,
    this.digitCount,
    this.fractionType,
  });
}
