import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/core/components/sliding_toggle_button.dart';
import 'package:math_skill_up/features/question_setting/model/question_setting_model.dart';

class QuestionSettingScreen extends ConsumerWidget {
  const QuestionSettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('문제 설정', style: Theme.of(context).textTheme.displayLarge),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SlidingToggleButton<QuestionType>(
            title: "유형",
            values: QuestionType.values, // Enum 값 전달
            onOptionSelected: (selectedOption) {
              print("선택된 옵션: ${selectedOption.displayName}");
            },
          ),
        ],
      ),
    );
  }
}
