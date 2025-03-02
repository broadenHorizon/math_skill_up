import 'package:math_skill_up/features/question/model/quiestion_model.dart';
import 'package:math_skill_up/features/result/model/result_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'result_list_repository.g.dart';

@riverpod
class ResultListRepository extends _$ResultListRepository {
  late List<Result> resultList;

  @override
  List<Result> build() {
    resultList = [];
    return resultList;
  }

  /// 결과 추가
  /// [question] 문제
  /// [time] 문제 푸는 시간
  /// [userAnswer] 사용자가 입력한 답 (BasicOperation: double, FractionOperation: FractionOperationAnswer, AlphabetOperation: String)
  void addResult(Question question, double time, String userAnswer) {
    if (question is BasicOperationQuestion) {
      double? answer = userAnswer == "" ? null : double.parse(userAnswer);
      resultList.add(BasicResult(
        userAnswer: answer,
        isCorrect: question.answer == answer,
        time: time,
        question: question,
      ));
    } else if (question is FractionOperationQuestion) {
      FractionOperationAnswer? answer;
      if (userAnswer == "first") {
        answer = FractionOperationAnswer.first;
      } else if (userAnswer == "second") {
        answer = FractionOperationAnswer.second;
      } else if (userAnswer == "equal") {
        answer = FractionOperationAnswer.equal;
      }
      resultList.add(FractionResult(
        userAnswer: answer,
        isCorrect: question.biggerFraction == answer,
        time: time,
        question: question,
      ));
    } else if (question is AlphabetOperationQuestion) {
      resultList.add(AlphabetResult(
        userAnswer: userAnswer == "" ? null : userAnswer,
        isCorrect: question.answer == userAnswer,
        time: time,
        question: question,
      ));
    }
  }
}
