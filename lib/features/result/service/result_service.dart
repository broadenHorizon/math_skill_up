import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/features/history/model/history_model.dart';
import 'package:math_skill_up/features/history/repository/history_repository.dart';
import 'package:math_skill_up/features/history/repository/hive_history_repository.dart';
import 'package:math_skill_up/features/question_setting/model/question_setting_model.dart';
import 'package:math_skill_up/features/result/model/result_model.dart';
import 'package:math_skill_up/features/result/repository/result_list_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'result_service.g.dart';

@riverpod
ResultService resultService(Ref ref) {
  return ResultService(ref: ref);
}

class ResultService {
  final Ref ref;

  ResultService({
    required this.ref,
  });

  ResultSummary? calResultSummary() {
    List<Result> results = ref.watch(resultListRepositoryProvider);
    if (results.isEmpty) return null;

    double totalTime = results.fold(
        0, (previousValue, element) => previousValue + element.time);
    double averageTime = totalTime / results.length;

    int totalQuestions = results.length;
    int correctQuestions = results.where((element) => element.isCorrect).length;
    double averageAccuracy = correctQuestions / totalQuestions;

    History? latestHistory = getLatestHistory(results.first);

    double timeChange =
        latestHistory == null ? 0 : averageTime - latestHistory.elapsedTime;
    double accuracyChange =
        latestHistory == null ? 0 : averageAccuracy - latestHistory.accuracy;

    return ResultSummary(
      totalTime: totalTime,
      averageTime: averageTime,
      totalQuestions: totalQuestions,
      correctQuestions: correctQuestions,
      averageAccuracy: averageAccuracy,
      timeChange: timeChange,
      accuracyChange: accuracyChange,
    );
  }

  History? getLatestHistory(Result result) {
    HistoryRepository historyRepository = ref.read(historyRepositoryProvider);
    if (result is BasicResult) {
      switch (result.question.operator) {
        case ArithmeticType.addition:
          return historyRepository.getLatestAdditionHistory();
        case ArithmeticType.subtraction:
          return historyRepository.getLatestSubtractionHistory();
        case ArithmeticType.multiplication:
          return historyRepository.getLatestMultiplicationHistory();
        case ArithmeticType.division:
          return historyRepository.getLatestDivisionHistory();
      }
    } else if (result is FractionResult) {
      switch (result.question.type) {
        case FractionType.fraction:
          return historyRepository.getLatestFractionHistory();
        case FractionType.percent:
          return historyRepository.getLatestPercentHistory();
      }
    } else if (result is AlphabetResult) {
      return historyRepository.getLatestAlphabetHistory();
    }

    throw ArgumentError('Unknown result type');
  }
}
