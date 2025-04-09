import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:math_skill_up/features/history/model/history_model.dart';
import 'package:math_skill_up/features/history/repository/history_repository.dart';
import 'package:math_skill_up/features/question_setting/model/question_setting_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:math';

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
  late final Box<List<History>> _box;
  bool _isInitialized = false; // 초기화 여부 추적

  @override
  Future<void> init() async {
    print("init 시작");
    if (_isInitialized) {
      return;
    }
    // 디버그 모드일 때만 Box를 삭제한다. restart를 하면서 Hot Restart는 기존 앱 데이터를 그대로 유지한 채, 코드만 재실행하므로,
    // 이전 실행 때 남아 있던 Box 내부의 List 구조가 “새로운 어댑터 / 모델 구조”와 달라질 수 있습니다(예: List).
    await Hive.deleteBoxFromDisk(_boxName);

    if (!Hive.isBoxOpen(_boxName)) {
      if (!Hive.isAdapterRegistered(1)) {
        Hive.registerAdapter(HistoryAdapter());
      }
      if (!Hive.isAdapterRegistered(2)) {
        Hive.registerAdapter(QuestionTypeAdapter());
      }
      if (!Hive.isAdapterRegistered(4)) {
        Hive.registerAdapter(ArithmeticTypeAdapter());
      }
      if (!Hive.isAdapterRegistered(6)) {
        Hive.registerAdapter(FractionTypeAdapter());
      }

      _box = await Hive.openBox<List<History>>(_boxName);

      // TODO: 개발 단계에서만 사용. 삭제 해야함.
      if (_box.values.isEmpty) {
        await writeDummyData(_box);
      }
    } else {
      _box = Hive.box<List<History>>(_boxName);
    }
    _isInitialized = true;
  }

  Future<void> writeDummyData(Box<List<History>> box) async {
    // 랜덤한 더미 데이터 생성 함수
    List<History> generateHistories(
      QuestionType questionType,
      ArithmeticType arithmeticType,
      FractionType fractionType,
    ) {
      final random = Random();

      return List<History>.generate(30, (index) {
        return History(
          date: DateTime.now().subtract(Duration(days: index)),
          elapsedTime: 10000 + random.nextInt(5000) - random.nextInt(2000),
          accuracy: (0.5 + random.nextDouble() * 0.3).clamp(0.0, 1.0),
          questionType: questionType,
          arithmeticType: arithmeticType,
          fractionType: fractionType,
        );
      });
    }

    // 새로운 더미 데이터 저장
    await box.put(
        "addition",
        generateHistories(QuestionType.arithmetic, ArithmeticType.addition,
            FractionType.fraction));
    await box.put(
        "subtraction",
        generateHistories(QuestionType.arithmetic, ArithmeticType.subtraction,
            FractionType.fraction));
    await box.put(
        "multiplication",
        generateHistories(QuestionType.arithmetic,
            ArithmeticType.multiplication, FractionType.fraction));
    await box.put(
        "division",
        generateHistories(QuestionType.arithmetic, ArithmeticType.division,
            FractionType.fraction));
    await box.put(
        "fraction",
        generateHistories(QuestionType.fraction, ArithmeticType.addition,
            FractionType.fraction));
    await box.put(
        "percent",
        generateHistories(QuestionType.fraction, ArithmeticType.addition,
            FractionType.percent));
    await box.put(
        "alphabet",
        generateHistories(QuestionType.alphabet, ArithmeticType.addition,
            FractionType.fraction));
  }

  void _addHistory(String key, History history) {
    List<History> histories = _box.get(key)?.cast<History>() ?? [];
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
    return _box.get(_additionKey)?.cast<History>() ?? [];
  }

  @override
  List<History> getAlphabetHistory() {
    return _box.get(_alphabetKey)?.cast<History>() ?? <History>[];
  }

  @override
  List<History> getDivisionHistory() {
    return _box.get(_divisionKey)?.cast<History>() ?? [];
  }

  @override
  List<History> getFractionHistory() {
    return _box.get(_fractionKey)?.cast<History>() ?? [];
  }

  @override
  List<History> getMultiplicationHistory() {
    return _box.get(_multiplicationKey)?.cast<History>() ?? [];
  }

  @override
  List<History> getPercentHistory() {
    return _box.get(_percentKey)?.cast<History>() ?? [];
  }

  @override
  List<History> getSubtractionHistory() {
    return _box.get(_subtractionKey)?.cast<History>() ?? [];
  }

  History? _getLatestHistory(String key) {
    List<History> histories = _box.get(key)?.cast<History>() ?? [];
    return histories.isNotEmpty ? histories.last : null;
  }

  @override
  History? getLatestAdditionHistory() {
    return _getLatestHistory(_additionKey);
  }

  @override
  History? getLatestAlphabetHistory() {
    return _getLatestHistory(_alphabetKey);
  }

  @override
  History? getLatestDivisionHistory() {
    return _getLatestHistory(_divisionKey);
  }

  @override
  History? getLatestFractionHistory() {
    return _getLatestHistory(_fractionKey);
  }

  @override
  History? getLatestMultiplicationHistory() {
    return _getLatestHistory(_multiplicationKey);
  }

  @override
  History? getLatestPercentHistory() {
    return _getLatestHistory(_percentKey);
  }

  @override
  History? getLatestSubtractionHistory() {
    return _getLatestHistory(_subtractionKey);
  }
}
