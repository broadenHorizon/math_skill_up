import 'package:math_skill_up/features/question/constant/alphabet.dart';
import 'package:math_skill_up/features/question/model/quiestion_model.dart';
import 'package:math_skill_up/features/question/util/alphabet_operation_util.dart';
import 'package:math_skill_up/features/question/util/basic_operation_util.dart';
import 'package:math_skill_up/features/question/util/fraction_operation_util.dart';
import 'package:math_skill_up/features/question_setting/model/question_setting_model.dart';

/// 사칙연산 유형의 질문 생성
List<BasicOperationQuestion> createBasicQuestions(
    QuestionSettingModel settings) {
  final List<BasicOperationQuestion> questions = [];
  final int firstNum =
      generateRandomInt(digit: getDigitNumber(settings.digitCount));
  final int secondNum =
      generateRandomInt(digit: getDigitNumber(settings.digitCount));

  for (int i = 0; i < settings.questionCount.index + 1; i++) {
    questions.add(BasicOperationQuestion(
        id: i + 1,
        firstNum: firstNum,
        secondNum: secondNum,
        operator: settings.arithmeticType,
        answer: calculator(firstNum, secondNum, settings.arithmeticType)));
  }

  return questions;
}

/// 분수 비교 유형의 질문 생성
List<FractionOperationQuestion> createFractionQuestions(
    QuestionSettingModel settings) {
  final List<FractionOperationQuestion> questions = [];

  for (int i = 0; i < settings.questionCount.index + 1; i++) {
    int denominatorDigit = generateRandomInt(minNum: 3, maxNum: 4);
    int numeratorDigit = generateRandomInt(minNum: 3, maxNum: 4);
    Fraction firstFraction = generateRandomFraction(
        numeratorDigit: numeratorDigit, denominatorDigit: denominatorDigit);
    Fraction secondFraction = generateRandomFraction(
        numeratorDigit: numeratorDigit, denominatorDigit: denominatorDigit);
    // 첫번째 분수와 두번째 분수가 값이 같지 않도록 예외처리
    while (firstFraction.value == secondFraction.value) {
      secondFraction = generateRandomFraction(
          numeratorDigit: numeratorDigit, denominatorDigit: denominatorDigit);
    }
    questions.add(
      FractionOperationQuestion(
        id: i + 1,
        type: settings.fractionType,
        firstFraction: firstFraction,
        secondFraction: secondFraction,
        biggerFraction: FractionOperationAnswer.first,
      ),
    );
  }

  return questions;
}

/// 알파벳 계산 유형의 질문 생성
List<AlphabetOperationQuestion> createAlphabetQuestions(
    QuestionSettingModel settings) {
  final List<AlphabetOperationQuestion> questions = [];

  for (int i = 0; i < settings.questionCount.index + 1; i++) {
    final int firstAlphabetIndex =
        generateRandomInt(minNum: 0, maxNum: alphabet.length - 1);
    final ArithmeticType operator = generateRandomOperator();
    final int secondNumber = generateRandomInt(
        minNum: firstAlphabetIndex - 5, maxNum: firstAlphabetIndex + 5);

    int resultAlphabetIndex = firstAlphabetIndex + secondNumber;
    if (resultAlphabetIndex < 0) {
      resultAlphabetIndex += alphabet.length;
    }
    resultAlphabetIndex = resultAlphabetIndex % alphabet.length;
    final List tmp = [
      alphabet[firstAlphabetIndex],
      secondNumber,
      alphabet[resultAlphabetIndex]
    ];

    int blankPositon = generateRandomInt(minNum: 0, maxNum: 2);
    questions.add(
      AlphabetOperationQuestion(
        id: i + 1,
        firstAlphabet: blankPositon == 0 ? null : alphabet[firstAlphabetIndex],
        operator: blankPositon == 1 ? ArithmeticType.addition : operator,
        secondNumber: blankPositon == 1 ? null : secondNumber,
        resultAlphabet:
            blankPositon == 2 ? null : alphabet[resultAlphabetIndex],
        answer: tmp[blankPositon],
      ),
    );
  }

  return questions;
}
