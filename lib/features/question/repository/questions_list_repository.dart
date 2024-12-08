import 'package:math_skill_up/features/home/model/question_settings_model.dart';
import 'package:math_skill_up/features/home/service/home_service.dart';
import 'package:math_skill_up/features/question/model/quiestion_model.dart';
import 'package:math_skill_up/features/question/repository/create_random_questions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'questions_list_repository.g.dart';

@riverpod
class QuestionsListRepository extends _$QuestionsListRepository {
  @override
  List<Question> build() {
    return [];
  }

  void createNewQuestionsList() {
    final homeService = ref.read(homeServiceProvider);
    final settings = homeService.getSettingsData();

    List<Question> newQuestionsList = [];

    switch (settings.problemType) {
      case QuestionType.arithmetic:
        newQuestionsList = createBasicQuestions(settings);
        break;
      case QuestionType.fraction:
        newQuestionsList = createFractionQuestions(settings);
        break;
      case QuestionType.alphabet:
        newQuestionsList = createAlphabetQuestions(settings);
        break;
    }

    // 상태 업데이트
    state = newQuestionsList;
  }
}
