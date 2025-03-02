import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_answer_repository.g.dart';

@riverpod
class UserAnswerRepository extends _$UserAnswerRepository {
  @override
  String build() {
    return "";
  }

  void setUserAnswer(String userAnswer) {
    state = userAnswer; // 상태 업데이트
  }

  String getUserAnswer() {
    return state;
  }
}
