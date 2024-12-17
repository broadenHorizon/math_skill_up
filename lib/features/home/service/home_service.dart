import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/features/home/model/question_settings_model.dart';
import 'package:math_skill_up/features/home/model/question_type_model.dart';
import 'package:math_skill_up/features/home/repository/hive_question_settings_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_service.g.dart';

@riverpod
HomeService homeService(Ref ref) {
  return HomeService(ref: ref);
}

class HomeService {
  final Ref ref;

  HomeService({
    required this.ref,
  });

  QuestionTypeModel getSettingsDisplay() {
    final asyncSettings = ref.watch(hiveQuestionSettingsRepositoryProvider);

    // 문제 유형 및 문항 수 기본값 설정
    String type = "알 수 없음";
    String count = "알 수 없음";

    if (asyncSettings.hasValue) {
      final settings = asyncSettings.value!;

      switch (settings.problemType) {
        case QuestionType.arithmetic:
          final digit = settings.digitCount?.displayName ?? "n/a";
          final arithmetic = settings.arithmeticType?.displayName ?? "n/a";
          type = "$digit 자리 $arithmetic"; // 예: "10 자리 덧셈"
          break;
        case QuestionType.fraction:
          type = "${settings.fractionType?.displayName ?? "n/a"} 비교";
          break;
        case QuestionType.alphabet:
          type = "알파벳 계산";
          break;
      }
      count = "${settings.questionCount.displayName} 문항"; // 예: "10 문항"
    }

    return QuestionTypeModel(type: type, count: count);
  }

  QuestionSettingsModel getSettingsData() {
    final asyncSettings = ref.watch(hiveQuestionSettingsRepositoryProvider);

    if (asyncSettings.hasValue) {
      final settings = asyncSettings.value!;
      return settings;
    }

    return QuestionSettingsModel(
        problemType: QuestionType.arithmetic, // 사칙연산
        questionCount: QuestionCount.ten, // 10문항
        arithmeticType: ArithmeticType.addition, // 덧셈
        digitCount: DigitCount.one, // 10자리
        fractionType: FractionType.fraction);
  }
}
