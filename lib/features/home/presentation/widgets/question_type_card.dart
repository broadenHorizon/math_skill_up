import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/features/home/repository/hive_question_settings_repository.dart';
import 'package:math_skill_up/features/home/model/question_settings_model.dart';

class QuestionTypeCard extends ConsumerWidget {
  const QuestionTypeCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncSettings = ref.watch(hiveQuestionSettingsRepositoryProvider);

    // 문제 유형 및 문항 수 기본값 설정
    String problemText = "알 수 없음";
    String countText = "알 수 없음";

    if (asyncSettings.hasValue) {
      final settings = asyncSettings.value!;

      switch (settings.problemType) {
        case QuestionType.arithmetic:
          final digit = settings.digitCount?.name ?? "알 수 없음";
          final arithmetic = settings.arithmeticType?.name ?? "알 수 없음";
          problemText = "$digit 자리 $arithmetic"; // 예: "10 자리 덧셈"
          break;
        case QuestionType.fraction:
          problemText = settings.fractionType?.name == "percent"
              ? "퍼센트"
              : "분수"; // 예: "퍼센트" 또는 "분수"
          break;
        case QuestionType.alphabet:
          problemText = "알파벳";
          break;
      }
      countText = "${settings.questionCount.name} 문항"; // 예: "10 문항"
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '문제 유형',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.edit),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$problemText   |   $countText',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).secondaryHeaderColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    // 버튼 클릭 시 동작 추가
                  },
                  child: Text(
                    '변경하기',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
