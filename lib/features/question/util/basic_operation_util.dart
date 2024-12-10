import 'dart:math';

import 'package:math_skill_up/features/home/model/question_settings_model.dart';

/// DigitCount 타입을 정수로 변환합니다.
int getDigitNumber(DigitCount digitCount) {
  switch (digitCount) {
    case DigitCount.ten:
      return 1;
    case DigitCount.twenty:
      return 2;
    case DigitCount.thirty:
      return 3;
    case DigitCount.forty:
      return 4;
    case DigitCount.fifty:
      return 5;
  }
}

String getDisplayOperatorWord(ArithmeticType operator) {
  switch (operator) {
    case ArithmeticType.addition:
      return '+';
    case ArithmeticType.subtraction:
      return '-';
    case ArithmeticType.multiplication:
      return 'x';
    case ArithmeticType.division:
      return '÷';
  }
}

/// 계산기
double calculator(num1, num2, operator) {
  switch (operator) {
    case ArithmeticType.addition:
      return (num1 + num2).toDouble();
    case ArithmeticType.subtraction:
      return num1 - num2.toDouble();
    case ArithmeticType.multiplication:
      return num1 * num2.toDouble();
    case ArithmeticType.division:
      return num1 / num2.toDouble();
  }
  return -1;
}

/// 지정된 자릿수에 맞는 랜덤 정수를 생성합니다.
/// [digit] 생성할 숫자의 자릿수 (예: 2 -> 10-99, 3 -> 100-999)
/// [minNum] 생성할 숫자의 최소수 (예: 231 -> 231-999)
/// [maxNum] 생성할 숫자의 최대수 (예: 231 -> 100-231)
int generateRandomInt({int? digit, int? minNum, int? maxNum}) {
  final random = Random();
  if (digit == null) {
    if (minNum == null || maxNum == null) {
      throw ArgumentError('digit을 지정하거나, minNum, maxNum을 지정해줘야 합니다.');
    }
    final int min = minNum;
    final int max = maxNum;
    if (min > max) {
      throw ArgumentError('랜덤 생성 범위의 최댓값이 최소값보다 작습니다.');
    }
    return min + random.nextInt(max - min + 1);
  }

  if (digit < 1) {
    throw ArgumentError('자릿수는 1 이상이어야 합니다.');
  }
  int min = pow(10, digit - 1).toInt(); // 최소값 (예: 10의 자리 -> 10)
  if (minNum != null) {
    min = minNum;
  }
  int max = pow(10, digit).toInt() - 1; // 최대값 (예: 10의 자리 -> 99)
  if (maxNum != null) {
    max = maxNum;
  }

  if (min > max) {
    throw ArgumentError('랜덤 생성 범위의 최댓값이 최소값보다 작습니다.');
  }
  return min + random.nextInt(max - min + 1);
}
