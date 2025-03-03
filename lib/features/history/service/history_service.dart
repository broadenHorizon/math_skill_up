import 'package:math_skill_up/features/history/model/history_model.dart';
import 'package:math_skill_up/features/history/provider/history_providers.dart';
import 'package:math_skill_up/features/history/repository/history_repository.dart';
import 'package:math_skill_up/features/history/repository/hive_history_repository.dart';
import 'package:math_skill_up/features/question_setting/model/question_setting_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_service.g.dart';

@riverpod
class HistoryNotifier extends _$HistoryNotifier {
  @override
  Future<List<History>> build() async {
    HistoryRepository historyRepository = ref.read(historyRepositoryProvider);
    HistorySettingModel historySetting = ref.watch(historySettingProvider);
    await historyRepository.init();
    return getFilteredHistories(historySetting, historyRepository);
  }

  getFilteredHistories(
      HistorySettingModel historySetting, HistoryRepository historyRepository) {
    switch (historySetting.questionType) {
      case QuestionType.arithmetic:
        switch (historySetting.arithmeticType) {
          case ArithmeticType.addition:
            return historyRepository.getAdditionHistory();
          case ArithmeticType.subtraction:
            return historyRepository.getSubtractionHistory();
          case ArithmeticType.multiplication:
            return historyRepository.getMultiplicationHistory();
          case ArithmeticType.division:
            return historyRepository.getDivisionHistory();
        }
      case QuestionType.fraction:
        switch (historySetting.fractionType) {
          case FractionType.fraction:
            return historyRepository.getFractionHistory();
          case FractionType.percent:
            return historyRepository.getPercentHistory();
        }
      case QuestionType.alphabet:
        return historyRepository.getAlphabetHistory();
    }
  }
}
