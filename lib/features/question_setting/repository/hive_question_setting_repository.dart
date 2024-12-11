import 'package:hive/hive.dart';
import 'package:math_skill_up/features/question_setting/model/question_setting_model.dart';
import 'package:math_skill_up/features/question_setting/repository/question_setting_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hive_question_setting_repository.g.dart';

@riverpod
class HiveQuestionSettingRepository extends _$HiveQuestionSettingRepository
    implements QuestionSettingRepository {
  static const String _boxName = "questionSettingsBox";
  final String _key = "settings";

  // QuestionSettingsModel 데이터를 저장할 Hive Box
  late Box<QuestionSettingModel> _box;

  Future<void> _initBox() async {
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(QuestionTypeAdapter());
    }
    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter(QuestionCountAdapter());
    }
    if (!Hive.isAdapterRegistered(4)) {
      Hive.registerAdapter(ArithmeticTypeAdapter());
    }
    if (!Hive.isAdapterRegistered(5)) {
      Hive.registerAdapter(DigitCountAdapter());
    }
    if (!Hive.isAdapterRegistered(6)) {
      Hive.registerAdapter(FractionTypeAdapter());
    }
    if (!Hive.isAdapterRegistered(7)) {
      Hive.registerAdapter(QuestionSettingModelAdapter());
    }

    _box = await Hive.openBox<QuestionSettingModel>(_boxName);

    // 저장된 값이 없을 경우 초기값 설정
    if (_box.isEmpty) {
      final defaultSettings = QuestionSettingModel(
        questionType: QuestionType.arithmetic, // 사칙연산
        questionCount: QuestionCount.ten, // 10문항
        arithmeticType: ArithmeticType.addition, // 덧셈
        digitCount: DigitCount.one, // 1자리
      );
      await _box.put('settings', defaultSettings);
    }
  }

  @override
  Future<QuestionSettingModel?> build() async {
    await _initBox();
    return _box.get(_key); // key 'settings'로 저장된 데이터를 불러옴
  }

  @override
  Future<void> save(QuestionSettingModel settings) async {
    await _initBox();
    await _box.put(_key, settings); // key 'settings'로 데이터를 저장
  }
}
