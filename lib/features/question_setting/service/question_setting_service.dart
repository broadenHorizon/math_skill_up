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
  QuestionType _selectedQuestionType = initialSetting.questionType;
  QuestionCount _selectedQuestionCount = initialSetting.questionCount;
  ArithmeticType _selectedArithmeticType = initialSetting.arithmeticType;
  DigitCount _selectedDigitCount = initialSetting.digitCount;
  FractionType _selectedFractionType = initialSetting.fractionType;

  QuestionSettingService({
    required this.ref,
  }) {
    // 초기화 작업 수행
    _initializeSettings();
  }

  QuestionType get selectedQuestionType => _selectedQuestionType;
  QuestionCount get selectedQuestionCount => _selectedQuestionCount;
  ArithmeticType get selectedArithmeticType => _selectedArithmeticType;
  DigitCount get selectedDigitCount => _selectedDigitCount;
  FractionType get selectedFractionType => _selectedFractionType;

  Future<void> _initializeSettings() async {
    // HiveQuestionSettingRepository를 가져와 데이터를 초기화
    final asyncSettings = ref.watch(hiveQuestionSettingRepositoryProvider);
    if (asyncSettings.hasValue) {
      final settings = asyncSettings.value!;
      _selectedQuestionType = settings.questionType;
      _selectedQuestionCount = settings.questionCount;
      _selectedArithmeticType = settings.arithmeticType;
      _selectedDigitCount = settings.digitCount;
      _selectedFractionType = settings.fractionType;
    }
  }

  void setQuestionType(QuestionType questionType) {
    _selectedQuestionType = questionType;
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
}
