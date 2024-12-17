import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:math_skill_up/core/components/expanded_text_botton.dart';
import 'package:math_skill_up/core/components/loading_indicator.dart';
import 'package:math_skill_up/core/components/sliding_toggle_button.dart';
import 'package:math_skill_up/features/question_setting/model/question_setting_model.dart';
import 'package:math_skill_up/features/question_setting/service/question_setting_service.dart';

class QuestionSettingScreen extends ConsumerWidget {
  const QuestionSettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionSettingService = ref.watch(questionSettingServiceProvider);
    final asyncQuestionSetting = questionSettingService.getQuestionSetting();

    return Scaffold(
      appBar: AppBar(
        title: Text('문제 설정', style: Theme.of(context).textTheme.displayLarge),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: asyncQuestionSetting.when(
          data: (questionSetting) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SlidingToggleButton<QuestionType>(
                title: "유형",
                value: questionSetting.questionType,
                values: QuestionType.values,
                onOptionSelected: (selectedOption) {
                  questionSettingService.setQuestionType(selectedOption);
                },
              ),
              SlidingToggleButton<QuestionCount>(
                title: "문항",
                value: questionSetting.questionCount,
                values: QuestionCount.values,
                onOptionSelected: (selectedOption) {
                  questionSettingService.setQuestionCount(selectedOption);
                },
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: Text(
                  "세부 설정",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              // 선택된 유형에 따라 세부 설정 UI 표시
              if (questionSetting.questionType == QuestionType.arithmetic) ...[
                SlidingToggleButton<ArithmeticType>(
                  title: "문제 유형",
                  value: questionSetting.arithmeticType,
                  values: ArithmeticType.values,
                  onOptionSelected: (selectedOption) {
                    questionSettingService.setArithmeticType(selectedOption);
                  },
                ),
                SlidingToggleButton<DigitCount>(
                  title: "자리 수",
                  value: questionSetting.digitCount,
                  values: DigitCount.values,
                  onOptionSelected: (selectedOption) {
                    questionSettingService.setDigitCount(selectedOption);
                  },
                )
              ] else if (questionSetting.questionType == QuestionType.fraction)
                SlidingToggleButton<FractionType>(
                  title: "문제 유형",
                  value: questionSetting.fractionType,
                  values: FractionType.values,
                  onOptionSelected: (selectedOption) {
                    questionSettingService.setFractionType(selectedOption);
                  },
                ),
            ],
          ),
          error: (error, stackTrace) =>
              const Center(child: Text("에러가 발생했습니다.")), // TODO: 공통 위젯으로 교체
          loading: () =>
              const Center(child: LoadingIndicator()), // TODO: 공통 위젯으로 교체
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ExpandedTextBotton(
            onPressed: () {
              // 적용 버튼 클릭 시 동작 추가
              questionSettingService.saveAll();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('설정이 적용되었습니다.')),
              );
              context.pop();
            },
            text: '적용'),
      ),
    );
  }
}
