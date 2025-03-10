import 'package:math_skill_up/features/question/model/quiestion_model.dart';
import 'package:math_skill_up/features/result/model/result_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'result_list_repository.g.dart';

@riverpod
class ResultListRepository extends _$ResultListRepository {
  @override
  List<Result> build() {
    return [];
  }

  // 초기화
  // 새로운 문제 풀이가 시작되면, 초기화를 진행한다.
  void reset() {
    state = [];
  }

  /// 결과 추가
  /// [question] 문제
  /// [time] 문제 푸는 시간
  /// [userAnswer] 사용자가 입력한 답 (BasicOperation: double, FractionOperation: FractionOperationAnswer, AlphabetOperation: String)
  void addResult(Question question, double time, String userAnswer) {
    try {
      if (question is BasicOperationQuestion) {
        double? answer =
            userAnswer.isEmpty ? null : double.tryParse(userAnswer);
        state = [
          ...state,
          BasicResult(
            userAnswer: answer,
            isCorrect: question.answer == answer,
            time: time,
            question: question,
          ),
        ];
      } else if (question is FractionOperationQuestion) {
        FractionOperationAnswer? answer;
        switch (userAnswer) {
          case "first":
            answer = FractionOperationAnswer.first;
            break;
          case "second":
            answer = FractionOperationAnswer.second;
            break;
          case "equal":
            answer = FractionOperationAnswer.equal;
            break;
          default:
            answer = null;
        }
        state = [
          ...state,
          FractionResult(
            userAnswer: answer,
            isCorrect: question.biggerFraction == answer,
            time: time,
            question: question,
          ),
        ];
      } else if (question is AlphabetOperationQuestion) {
        state = [
          ...state,
          AlphabetResult(
            userAnswer: userAnswer.isEmpty ? null : userAnswer,
            isCorrect: question.answer == userAnswer,
            time: time,
            question: question,
          ),
        ];
      }
    } catch (e) {
      print("Error parsing userAnswer: $e");
    }
  }
}
