import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:math_skill_up/core/components/expanded_text_botton.dart';
import 'package:math_skill_up/core/components/sliding_toggle_button.dart';
import 'package:math_skill_up/features/history/provider/history_providers.dart';
import 'package:math_skill_up/features/question_setting/model/question_setting_model.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historySetting = ref.watch(historySettingProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('히스토리', style: Theme.of(context).textTheme.displayLarge),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SlidingToggleButton<QuestionType>(
              title: "유형",
              value: historySetting.questionType,
              values: QuestionType.values,
              onOptionSelected: (selectedOption) {
                ref
                    .read(historySettingProvider.notifier)
                    .setQuestionType(selectedOption);
              },
            ),
            // 선택된 유형에 따라 세부 설정 UI 표시
            if (historySetting.questionType == QuestionType.arithmetic)
              SlidingToggleButton<ArithmeticType>(
                title: "문제 유형",
                value: historySetting.arithmeticType,
                values: ArithmeticType.values,
                onOptionSelected: (selectedOption) {
                  ref
                      .read(historySettingProvider.notifier)
                      .setArithmeticType(selectedOption);
                },
              )
            else if (historySetting.questionType == QuestionType.fraction)
              SlidingToggleButton<FractionType>(
                title: "문제 유형",
                value: historySetting.fractionType,
                values: FractionType.values,
                onOptionSelected: (selectedOption) {
                  ref
                      .read(historySettingProvider.notifier)
                      .setFractionType(selectedOption);
                },
              ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ExpandedTextBotton(
            onPressed: () {
              context.pop();
            },
            text: '뒤로 가기'),
      ),
    );
  }
}
