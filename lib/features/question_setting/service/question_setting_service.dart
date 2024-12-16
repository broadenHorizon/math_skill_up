import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  QuestionCount? _selectedQuestionCount;
  ArithmeticType? _selectedArithmeticType;
  DigitCount? _selectedDigitCount;
  FractionType? _selectedFractionType;

  QuestionSettingService({
    required this.ref,
  });

  AsyncValue<QuestionSettingModel> getQuestionSetting() {
    return ref.watch(hiveQuestionSettingRepositoryProvider);
  }

  Future<void> setQuestionType(QuestionType questionType) async {
    QuestionSettingModel questionSetting = await _readCurrentSetting();
    await ref
        .read(hiveQuestionSettingRepositoryProvider.notifier)
        .save(questionSetting.copyWith(questionType: questionType));
  }

  void setQuestionCount(QuestionCount questionCount) {
    _selectedQuestionCount = questionCount;
  }

  void setArithmeticType(ArithmeticType arithmeticType) {
    _selectedArithmeticType = arithmeticType;
  }

  void setDigitCount(DigitCount digitCount) {
    _selectedDigitCount = digitCount;
  }

  void setFractionType(FractionType fractionType) {
    _selectedFractionType = fractionType;
  }

  Future<void> saveAll() async {
    QuestionSettingModel questionSetting = await _readCurrentSetting();
    await ref
        .read(hiveQuestionSettingRepositoryProvider.notifier)
        .save(questionSetting.copyWith(
          questionCount: _selectedQuestionCount,
          arithmeticType: _selectedArithmeticType,
          digitCount: _selectedDigitCount,
          fractionType: _selectedFractionType,
        ));
  }

  Future<QuestionSettingModel> _readCurrentSetting() async {
    return await ref.read(hiveQuestionSettingRepositoryProvider.future);
  }
}
