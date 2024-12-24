import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/features/question/model/quiestion_model.dart';
import 'package:math_skill_up/features/question/presentation/widgets/question_box/blank_box.dart';
import 'package:math_skill_up/features/question/util/basic_operation_util.dart';

class AlphabetQuestionBox extends ConsumerWidget {
  const AlphabetQuestionBox({super.key, required this.question});

  final AlphabetOperationQuestion question;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        question.firstAlphabet != null
            ? Text(
                '${question.firstAlphabet}',
                style: Theme.of(context).textTheme.displayMedium,
              )
            : const BlankBox(
                width: 50,
              ),
        const SizedBox(width: 10), // Text 사이에 마진 추가
        Text(
          getDisplayOperatorWord(question.operator),
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(width: 10), // Text 사이에 마진 추가
        question.secondNumber != null
            ? Text(
                '${question.secondNumber}',
                style: Theme.of(context).textTheme.displayMedium,
              )
            : const BlankBox(
                width: 50,
              ),
        const SizedBox(width: 10), // Text 사이에 마진 추가
        Text(
          '=',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(width: 10), // = 기호와 TextField 사이 간격
        question.resultAlphabet != null
            ? Text(
                '${question.resultAlphabet}',
                style: Theme.of(context).textTheme.displayMedium,
              )
            : const BlankBox(
                width: 50,
              ),
      ],
    );
  }
}
