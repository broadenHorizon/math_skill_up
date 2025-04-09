import 'package:math_skill_up/features/history/model/history_model.dart';

abstract class HistoryRepository {
  Future<void> init();
  List<History> getAdditionHistory();
  List<History> getSubtractionHistory();
  List<History> getMultiplicationHistory();
  List<History> getDivisionHistory();
  List<History> getFractionHistory();
  List<History> getPercentHistory();
  List<History> getAlphabetHistory();
  History? getLatestAdditionHistory();
  History? getLatestSubtractionHistory();
  History? getLatestMultiplicationHistory();
  History? getLatestDivisionHistory();
  History? getLatestFractionHistory();
  History? getLatestPercentHistory();
  History? getLatestAlphabetHistory();

  void addAdditionHistory(History history);
  void addSubtractionHistory(History history);
  void addMultiplicationHistory(History history);
  void addDivisionHistory(History history);
  void addFractionHistory(History history);
  void addPercentHistory(History history);
  void addAlphabetHistory(History history);
}
