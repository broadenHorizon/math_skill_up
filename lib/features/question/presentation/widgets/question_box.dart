import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/core/theme/app_colors.dart';
import 'package:math_skill_up/features/question/model/quiestion_model.dart';
import 'package:math_skill_up/features/question/repository/questions_list_repository.dart';
import 'package:math_skill_up/features/question/util/basic_operation_util.dart';

class QuestionBox extends ConsumerWidget {
  const QuestionBox({super.key, required this.target, required this.height});

  final int target;
  final double height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionList =
        ref.watch(questionsListRepositoryProvider.notifier).questionsList;
    if (questionList is List<BasicOperationQuestion>) {
      // questionList type을 BasicOperationQuestion으로 캐스팅
      return Container(
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.gray200)),
            color: AppColors.white),
        height: height,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            '${questionList[target].firstNum}',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text(
            getDisplayOperatorWord(questionList[target].operator),
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text(
            '${questionList[target].secondNum}',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ]),
      );
    }
    return SizedBox(
        child: Text(
      "Question",
      style: Theme.of(context).textTheme.displayLarge,
    ));
  }
}
