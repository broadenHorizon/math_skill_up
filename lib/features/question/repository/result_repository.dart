import 'package:math_skill_up/features/question/model/quiestion_model.dart';
import 'package:math_skill_up/features/result/model/result_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'result_repository.g.dart';

@riverpod
class ResultRepository extends _$ResultRepository {
  late Result result;

  @override
  Result build() {
    return Result(isCorrect: false, time: 0);
  }

  /// 문제 추가
  void addQuestion(Question question) {
    if (question is BasicOperationQuestion) {
      result = BasicResult(
        userAnswer: null,
        isCorrect: false,
        time: 0,
        question: question,
      );
    } else if (question is FractionOperationQuestion) {
      result = FractionResult(
        userAnswer: null,
        isCorrect: false,
        time: 0,
        question: question,
      );
    } else if (question is AlphabetOperationQuestion) {
      result = AlphabetResult(
        userAnswer: null,
        isCorrect: false,
        time: 0,
        question: question,
      );
    }
  }

  void addAnswer(dynamic answer) {
    if (result is BasicResult) {
      (result as BasicResult).userAnswer = answer as double?;
      if ((result as BasicResult).question.answer == answer) {
        (result as BasicResult).isCorrect = true;
      }
    } else if (result is FractionResult) {
      (result as FractionResult).userAnswer =
          answer as FractionOperationAnswer?;
      if ((result as FractionResult).question.biggerFraction == answer) {
        (result as FractionResult).isCorrect = true;
      }
    } else if (result is AlphabetResult) {
      (result as AlphabetResult).userAnswer = answer as String?;
      if ((result as AlphabetResult).question.answer == answer) {
        (result as AlphabetResult).isCorrect = true;
      }
    }
  }

  void addTime(double time) {
    result.time = time;
  }
}
