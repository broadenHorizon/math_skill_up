import 'package:hive/hive.dart';
import 'package:math_skill_up/features/history/model/history_model.dart';
import 'package:math_skill_up/features/history/repository/history_repository.dart';
import 'package:math_skill_up/features/question_setting/model/question_setting_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hive_history_repository.g.dart';

@riverpod
class HiveHistoryRepository extends _$HiveHistoryRepository
    implements HistoryRepository {
  static const String _boxName = "historyBox";

  // History 데이터를 저장할 Hive Box
  late Box<History> _box;

  Future<void> _initBox() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(HistoryAdapter());
    }
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(QuestionTypeAdapter());
    }
    _box = await Hive.openBox<History>(_boxName);
  }

  @override
  Future<List<History>> build() async {
    // Hive Box 초기화
    await _initBox();

    // 모든 히스토리를 리스트로 반환
    return _box.values.toList();
  }

  @override
  Future<void> addHistory(History history) async {
    // 새로운 히스토리를 Box에 추가
    await _box.add(history);
  }
}
