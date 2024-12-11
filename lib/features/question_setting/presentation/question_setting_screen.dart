import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/core/components/sliding_toggle_button.dart';
import 'package:math_skill_up/features/question_setting/model/question_setting_model.dart';
import 'package:math_skill_up/features/question_setting/service/question_setting_service.dart';

class QuestionSettingScreen extends ConsumerWidget {
  const QuestionSettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionSettingService = ref.watch(questionSettingServiceProvider);
    final currentSetting = questionSettingService.currentSetting;

    return Scaffold(
      appBar: AppBar(
        title: Text('문제 설정', style: Theme.of(context).textTheme.displayLarge),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SlidingToggleButton<QuestionType>(
              title: "유형",
              value: currentSetting.questionType,
              values: QuestionType.values,
              onOptionSelected: (selectedOption) {
                //
              },
            ),
            SlidingToggleButton<QuestionCount>(
              title: "문항",
              value: currentSetting.questionCount,
              values: QuestionCount.values,
              onOptionSelected: (selectedOption) {
                //
              },
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Text(
                "세부 설정",
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            // // 선택된 유형에 따라 세부 설정 UI 표시
            // if (selectedQuestionType == QuestionType.arithmetic)
            //   _ArithmeticSettings()
            // else if (selectedQuestionType == QuestionType.fraction)
            //   _FractionSettings()
            // else if (selectedQuestionType == QuestionType.alphabet)
            //   _AlphabetSettings(),
          ],
        ),
      ),
    );
  }
}
