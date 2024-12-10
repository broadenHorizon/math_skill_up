import 'package:math_skill_up/features/question/model/quiestion_model.dart';
import 'package:math_skill_up/features/question/util/basic_operation_util.dart';

/// 랜덤 함수를 생성합니다.
Fraction generateRandomFraction({
  int numeratorDigit = 3,
  int denominatorDigit = 4,
}) {
  // 분자 랜덤 값 생성 (9999는 안나오도록 제한)
  final numerator = generateRandomInt(digit: numeratorDigit, maxNum: 9998);

  // 분모 랜덤 값 생상
  int denominator = generateRandomInt(digit: denominatorDigit);

  return Fraction(numerator: numerator, denominator: denominator);
}

FractionOperationAnswer compareFraction(
    {required Fraction firstFraction, required Fraction secondFraction}) {
  if (firstFraction.value > secondFraction.value) {
    return FractionOperationAnswer.first;
  }
  return FractionOperationAnswer.second;
}
