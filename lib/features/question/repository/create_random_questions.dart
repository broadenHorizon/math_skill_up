import 'package:math_skill_up/features/home/model/question_settings_model.dart';
import 'package:math_skill_up/features/question/model/quiestion_model.dart';
import 'package:math_skill_up/features/question/util/basic_operation_util.dart';

/// 사칙연산 유형의 질문 생성
List<BasicOperationQuestion> createBasicQuestions(
    QuestionSettingsModel settings) {
  final List<BasicOperationQuestion> questions = [];
  final int firstNum = generateRandomInt(getDigitNumber(settings.digitCount!));
  final int secondNum = generateRandomInt(getDigitNumber(settings.digitCount!));

  for (int i = 0; i < settings.questionCount.index + 1; i++) {
    questions.add(BasicOperationQuestion(
        id: i + 1,
        firstNum: firstNum,
        secondNum: secondNum,
        operator: settings.arithmeticType!,
        answer: calculator(firstNum, secondNum, settings.arithmeticType!)));
  }

  return questions;
}

/// 분수 비교 유형의 질문 생성
List<FractionOperationQuestion> createFractionQuestions(
    QuestionSettingsModel settings) {
  final List<FractionOperationQuestion> questions = [];

  for (int i = 0; i < settings.questionCount.index + 1; i++) {
    questions.add(
      FractionOperationQuestion(id: i + 1, question: "", answer: 0),
    );
  }

  return questions;
}

/// 알파벳 계산 유형의 질문 생성
List<AlphabetOperationQuestion> createAlphabetQuestions(
    QuestionSettingsModel settings) {
  final List<AlphabetOperationQuestion> questions = [];

  for (int i = 0; i < settings.questionCount.index + 1; i++) {
    questions.add(
      AlphabetOperationQuestion(id: i + 1, question: '', answer: ''),
    );
  }

  return questions;
}
