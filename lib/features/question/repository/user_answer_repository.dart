import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_answer_repository.g.dart';

@riverpod
class UserAnswerRepository extends _$UserAnswerRepository {
  late dynamic _userAnswer;

  @override
  dynamic build() {
    _userAnswer = null;
    return _userAnswer;
  }

  void setUserAnswer(dynamic userAnswer) {
    _userAnswer = userAnswer;
  }

  dynamic getUserAnswer() {
    return _userAnswer;
  }
}
