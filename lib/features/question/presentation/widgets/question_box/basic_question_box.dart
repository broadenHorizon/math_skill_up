import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/features/question/model/quiestion_model.dart';
import 'package:math_skill_up/features/question/presentation/widgets/question_box/blank_box.dart';
import 'package:math_skill_up/features/question/util/basic_operation_util.dart';

class BasicQuestionBox extends ConsumerWidget {
  const BasicQuestionBox({super.key, required this.question});

  final BasicOperationQuestion question;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${question.firstNum}',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(width: 10), // Text 사이에 마진 추가
        Text(
          getDisplayOperatorWord(question.operator),
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(width: 10), // Text 사이에 마진 추가
        Text(
          '${question.secondNum}',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(width: 10), // Text 사이에 마진 추가
        Text(
          '=',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(width: 10), // = 기호와 TextField 사이 간격
        const BlankBox(
          width: 120,
        )
      ],
    );
  }
}
