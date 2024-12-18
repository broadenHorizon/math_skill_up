import 'package:hive/hive.dart';
import 'package:math_skill_up/core/constants/constants.dart';
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

  Future<QuestionSettingModel> _initBox() async {
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
    QuestionSettingModel? setting = _box.get(_key);
    if (setting == null) {
      await _box.put(_key, initialSetting);
      setting = initialSetting;
    }

    return setting;
  }

  @override
  Future<QuestionSettingModel> build() async {
    return await _initBox();
  }

  @override
  Future<void> save(QuestionSettingModel setting) async {
    await _box.put(_key, setting); // key 'settings'로 데이터를 저장
    state = AsyncData(setting);
  }
}