import 'package:math_skill_up/features/history/model/history_model.dart';

abstract class HistoryRepository {
  Future<List<History>> build();

  void addHistory(History history);

  // TODO: add more functions here
}
