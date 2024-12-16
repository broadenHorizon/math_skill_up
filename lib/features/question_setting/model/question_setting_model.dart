import 'package:hive/hive.dart';

part 'question_setting_model.g.dart';

// 문제 유형 enum
@HiveType(typeId: 2)
enum QuestionType {
  @HiveField(0)
  arithmetic('사칙연산'), // 사칙연산
  @HiveField(1)
  fraction('분수 비교'), // 분수
  @HiveField(2)
  alphabet('알파벳 계산'); // 알파벳

  final String displayName;

  const QuestionType(this.displayName);
}

// 문항 수 enum
@HiveType(typeId: 3)
enum QuestionCount {
  @HiveField(0)
  ten('10'), // 10 문항
  @HiveField(1)
  twenty('20'), // 20 문항
  @HiveField(2)
  thirty('30'), // 30 문항
  @HiveField(3)
  forty('40'), // 40 문항
  @HiveField(4)
  fifty('50'); // 50 문항

  final String displayName;

  const QuestionCount(this.displayName);
}

// 사칙연산 유형 enum
@HiveType(typeId: 4)
enum ArithmeticType {
  @HiveField(0)
  addition('덧셈'), // 덧셈
  @HiveField(1)
  subtraction('뺄셈'), // 뺄셈
  @HiveField(2)
  multiplication('곱셈'), // 곱셈
  @HiveField(3)
  division('나눗셈'); // 나눗셈

  final String displayName;

  const ArithmeticType(this.displayName);
}

// 사칙연산 자리수 enum
@HiveType(typeId: 5)
enum DigitCount {
  @HiveField(0)
  one('1'), // 1 자리
  @HiveField(1)
  two('2'), // 2 자리
  @HiveField(2)
  three('3'), // 3 자리
  @HiveField(3)
  four('4'), // 4 자리
  @HiveField(4)
  five('5'); // 5 자리

  final String displayName;

  const DigitCount(this.displayName);
}

// 분수 세부 유형 enum
@HiveType(typeId: 6)
enum FractionType {
  @HiveField(0)
  fraction('분수'), // 분수
  @HiveField(1)
  percent('퍼센스'); // 퍼센트

  final String displayName;

  const FractionType(this.displayName);
}

// 문제 모델
@HiveType(typeId: 7)
class QuestionSettingModel {
  @HiveField(0)
  final QuestionType questionType; // 문제 유형
  @HiveField(1)
  final QuestionCount questionCount; // 문항 수
  @HiveField(2)
  final ArithmeticType arithmeticType; // 사칙연산 유형
  @HiveField(3)
  final DigitCount digitCount; // 사칙연산 자리수
  @HiveField(4)
  final FractionType fractionType; // 분수 세부 유형

  QuestionSettingModel({
    required this.questionType,
    required this.questionCount,
    required this.arithmeticType,
    required this.digitCount,
    required this.fractionType,
  });
}
