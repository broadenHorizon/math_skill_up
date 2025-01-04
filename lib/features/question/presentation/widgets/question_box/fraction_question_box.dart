import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/features/question/model/quiestion_model.dart';
import 'package:math_skill_up/features/question/presentation/widgets/question_box/blank_box.dart';
import 'package:math_skill_up/features/question/presentation/widgets/question_box/fraction_widget.dart';
import 'package:math_skill_up/features/question_setting/model/question_setting_model.dart';

class FractionQuestionBox extends ConsumerWidget {
  const FractionQuestionBox({super.key, required this.question});

  final FractionOperationQuestion question;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        question.type == FractionType.fraction
            ? FractionWidget(
                fraction: question.firstFraction,
              )
            : Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20), // 왼쪽 여백
                  child: Text(
                    '${question.firstFraction.percent}%',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ),
        const SizedBox(width: 20), // Text 사이에 마진 추가
        const BlankBox(
          width: 50,
        ),
        const SizedBox(width: 20), // Text 사이에 마진 추가
        question.type == FractionType.fraction
            ? FractionWidget(
                fraction: question.secondFraction,
              )
            : Text(
                '${question.secondFraction.percent}%',
                style: Theme.of(context).textTheme.displayMedium,
              ),
      ],
    );
  }
}
