import 'package:math_skill_up/features/question/model/quiestion_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_question_repository.g.dart';

@riverpod
class CurrentQuestionRepository extends _$CurrentQuestionRepository {
  late Question _question;

  @override
  Question build() {
    _question = Question();
    return _question;
  }

  void setQuestion(Question question) {
    _question = question;
  }

  Question getQuestion() {
    return _question;
  }
}
