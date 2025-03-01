import 'package:math_skill_up/features/question_setting/model/question_setting_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_providers.g.dart';

class HistorySettingModel {
  final QuestionType questionType;
  final ArithmeticType arithmeticType;
  final FractionType fractionType;

  HistorySettingModel({
    required this.questionType,
    required this.arithmeticType,
    required this.fractionType,
  });

  HistorySettingModel copyWith({
    QuestionType? questionType,
    ArithmeticType? arithmeticType,
    FractionType? fractionType,
  }) {
    return HistorySettingModel(
      questionType: questionType ?? this.questionType,
      arithmeticType: arithmeticType ?? this.arithmeticType,
      fractionType: fractionType ?? this.fractionType,
    );
  }
}

@riverpod
class HistorySetting extends _$HistorySetting {
  @override
  HistorySettingModel build() {
    return HistorySettingModel(
        questionType: QuestionType.alphabet,
        arithmeticType: ArithmeticType.addition,
        fractionType: FractionType.fraction);
  }

  // Setter for questionType
  void setQuestionType(QuestionType newQuestionType) {
    state = state.copyWith(questionType: newQuestionType);
  }

  // Setter for arithmeticType
  void setArithmeticType(ArithmeticType newArithmeticType) {
    state = state.copyWith(arithmeticType: newArithmeticType);
  }

  // Setter for fractionType
  void setFractionType(FractionType? newFractionType) {
    state = state.copyWith(fractionType: newFractionType);
  }
}
