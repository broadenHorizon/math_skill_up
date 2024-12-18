import 'package:math_skill_up/features/question/model/quiestion_model.dart';
import 'package:math_skill_up/features/result/model/result_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'result_list_repository.g.dart';

@riverpod
class ResultListRepository extends _$ResultListRepository {
  late List<Result> resultList;

  @override
  List<Result> build() {
    return [];
  }

  /// 결과 추가
  /// [question] 문제
  /// [time] 문제 푸는 시간
  /// [userAnswer] 사용자가 입력한 답 (BasicOperation: double, FractionOperation: FractionOperationAnswer, AlphabetOperation: String)
  void addResult(Question question, double time, dynamic userAnswer) {
    if (question is BasicOperationQuestion) {
      resultList.add(BasicResult(
        userAnswer: userAnswer,
        isCorrect: question.answer == userAnswer,
        time: time,
        question: question,
      ));
    } else if (question is FractionOperationQuestion) {
      resultList.add(FractionResult(
        userAnswer: userAnswer,
        isCorrect: question.biggerFraction == userAnswer,
        time: time,
        question: question,
      ));
    } else if (question is AlphabetOperationQuestion) {
      resultList.add(AlphabetResult(
        userAnswer: userAnswer,
        isCorrect: question.answer == userAnswer,
        time: time,
        question: question,
      ));
    }
  }
}
