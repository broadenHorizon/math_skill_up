import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/core/constants/constants.dart';
import 'package:math_skill_up/features/question_setting/model/question_setting_model.dart';
import 'package:math_skill_up/features/question_setting/repository/hive_question_setting_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'question_setting_service.g.dart';

@riverpod
QuestionSettingService questionSettingService(Ref ref) {
  return QuestionSettingService(ref: ref);
}

class QuestionSettingService {
  final Ref ref;
  QuestionSettingModel _currentSetting = initialSetting;

  QuestionSettingService({
    required this.ref,
  }) {
    // 초기화 작업 수행
    _initializeSettings();
  }

  QuestionSettingModel get currentSetting => _currentSetting;

  Future<void> _initializeSettings() async {
    // HiveQuestionSettingRepository를 가져와 데이터를 초기화
    final asyncSettings = ref.watch(hiveQuestionSettingRepositoryProvider);
    if (asyncSettings.hasValue) {
      _currentSetting = asyncSettings.value!;
    }
  }

  // Future<void> updateSetting(QuestionSettingModel newSetting) async {
  //   // 설정 업데이트
  //   _currentSetting = newSetting;
  //   final repository = ref.read(hiveQuestionSettingRepositoryProvider);
  //   await repository.saveQuestionSettings(newSetting);
  // }
}
