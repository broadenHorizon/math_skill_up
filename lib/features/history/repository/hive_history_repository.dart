import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:math_skill_up/features/history/model/history_model.dart';
import 'package:math_skill_up/features/history/repository/history_repository.dart';
import 'package:math_skill_up/features/question_setting/model/question_setting_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hive_history_repository.g.dart';

@Riverpod(keepAlive: true)
HistoryRepository historyRepository(Ref ref) {
  return HiveHistoryRepository();
}

class HiveHistoryRepository implements HistoryRepository {
  static const String _boxName = "historyBox";
  static const String _additionKey = "addition";
  static const String _subtractionKey = "subtraction";
  static const String _multiplicationKey = "multiplication";
  static const String _divisionKey = "division";
  static const String _fractionKey = "fraction";
  static const String _percentKey = "percent";
  static const String _alphabetKey = "alphabet";

  // History 데이터를 저장할 Hive Box
  late Box<List<History>> _box;

  HiveHistoryRepository() {
    _initBox();
  }

  Future<void> _initBox() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(HistoryAdapter());
    }
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(QuestionTypeAdapter());
    }
    if (!Hive.isAdapterRegistered(4)) {
      Hive.registerAdapter(ArithmeticTypeAdapter());
    }
    if (!Hive.isAdapterRegistered(6)) {
      Hive.registerAdapter(FractionTypeAdapter());
    }
    _box = await Hive.openBox<List<History>>(_boxName);
  }

  void _addHistory(String key, History history) {
    List<History> histories = _box.get(key) ?? [];
    histories.add(history);
    _box.put(key, histories);
  }

  @override
  void addAdditionHistory(History history) {
    _addHistory(_additionKey, history);
  }

  @override
  void addAlphabetHistory(History history) {
    _addHistory(_alphabetKey, history);
  }

  @override
  void addDivisionHistory(History history) {
    _addHistory(_divisionKey, history);
  }

  @override
  void addFractionHistory(History history) {
    _addHistory(_fractionKey, history);
  }

  @override
  void addMultiplicationHistory(History history) {
    _addHistory(_multiplicationKey, history);
  }

  @override
  void addPercentHistory(History history) {
    _addHistory(_percentKey, history);
  }

  @override
  void addSubtractionHistory(History history) {
    _addHistory(_subtractionKey, history);
  }

  @override
  List<History> getAdditionHistory() {
    return _box.get(_additionKey) ?? [];
  }

  @override
  List<History> getAlphabetHistory() {
    return _box.get(_alphabetKey) ?? [];
  }

  @override
  List<History> getDivisionHistory() {
    return _box.get(_divisionKey) ?? [];
  }

  @override
  List<History> getFractionHistory() {
    return _box.get(_fractionKey) ?? [];
  }

  @override
  List<History> getMultiplicationHistory() {
    return _box.get(_multiplicationKey) ?? [];
  }

  @override
  List<History> getPercentHistory() {
    return _box.get(_percentKey) ?? [];
  }

  @override
  List<History> getSubtractionHistory() {
    return _box.get(_subtractionKey) ?? [];
  }
}
