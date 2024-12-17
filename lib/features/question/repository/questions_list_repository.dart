import 'package:math_skill_up/features/home/model/question_settings_model.dart';
import 'package:math_skill_up/features/home/service/home_service.dart';
import 'package:math_skill_up/features/question/model/quiestion_model.dart';
import 'package:math_skill_up/features/question/repository/create_random_questions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'questions_list_repository.g.dart';

@riverpod
class QuestionsListRepository extends _$QuestionsListRepository {
  late List<Question> _cachedQuestionsList;

  @override
  List<Question> build() {
    final homeService = ref.read(homeServiceProvider);
    final settings = homeService.getSettingsData();

    _cachedQuestionsList = _createQuestions(settings);
    return _cachedQuestionsList;
  }

  List<Question> get questionsList => _cachedQuestionsList;

  List<Question> _createQuestions(QuestionSettingsModel settings) {
    switch (settings.problemType) {
      case QuestionType.arithmetic:
        return createBasicQuestions(settings);
      case QuestionType.fraction:
        return createFractionQuestions(settings);
      case QuestionType.alphabet:
        return createAlphabetQuestions(settings);
      default:
        return [];
    }
  }
}
