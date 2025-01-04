import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/features/history/model/history_model.dart';
import 'package:math_skill_up/features/history/provider/history_providers.dart';
import 'package:math_skill_up/features/history/repository/hive_history_repository.dart';
import 'package:math_skill_up/features/question_setting/model/question_setting_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_service.g.dart';

@riverpod
HistoryService historyService(Ref ref) {
  return HistoryService(ref: ref);
}

class HistoryService {
  final Ref ref;

  HistoryService({
    required this.ref,
  });

  List<History> getFilteredHistories() {
    final historySetting = ref.watch(historySettingProvider);
    final historyRepository = ref.read(historyRepositoryProvider);

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
          default:
            // TODO : Error 처리
            print('error');
        }
      case QuestionType.fraction:
        switch (historySetting.fractionType) {
          case FractionType.fraction:
            return historyRepository.getFractionHistory();
          case FractionType.percent:
            return historyRepository.getPercentHistory();
          default:
            // TODO : Error 처리
            print('error');
        }
      case QuestionType.alphabet:
        return historyRepository.getAlphabetHistory();
      default:
        // TODO : Error 처리
        print('error');
    }
    //TODO: error 처리 후 제거
    return [];
  }
}
