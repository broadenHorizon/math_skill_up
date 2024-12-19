import 'package:math_skill_up/features/home/service/home_service.dart';
import 'package:math_skill_up/features/question/model/quiestion_model.dart';
import 'package:math_skill_up/features/question/repository/create_random_questions.dart';
import 'package:math_skill_up/features/question_setting/model/question_setting_model.dart';
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

  List<Question> _createQuestions(QuestionSettingModel settings) {
    switch (settings.questionType) {
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
