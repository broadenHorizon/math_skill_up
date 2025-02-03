import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/core/theme/app_colors.dart';
import 'package:math_skill_up/features/question/model/quiestion_model.dart';
import 'package:math_skill_up/features/question/presentation/widgets/question_box/alphabet_question_box.dart';
import 'package:math_skill_up/features/question/presentation/widgets/question_box/basic_question_box.dart';
import 'package:math_skill_up/features/question/presentation/widgets/question_box/fraction_question_box.dart';
import 'package:math_skill_up/features/question/repository/questions_list_repository.dart';
import 'package:math_skill_up/features/question/repository/current_question_repository.dart';

class QuestionBox extends ConsumerWidget {
  const QuestionBox({super.key, required this.target});

  final int target;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionList =
        ref.watch(questionsListRepositoryProvider.notifier).questionsList;
    final currentQuestion =
        ref.read(currentQuestionRepositoryProvider.notifier);

    Widget buildContainer(Widget child) {
      return Container(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.gray200)),
          color: AppColors.white,
        ),
        child: child,
      );
    }

    final question = questionList[target];
    currentQuestion.setQuestion(question);

    if (question is BasicOperationQuestion) {
      return buildContainer(BasicQuestionBox(question: question));
    } else if (question is FractionOperationQuestion) {
      return buildContainer(FractionQuestionBox(question: question));
    } else if (question is AlphabetOperationQuestion) {
      return buildContainer(AlphabetQuestionBox(question: question));
    } else {
      return buildContainer(SizedBox(
          child: Text(
        "Question",
        style: Theme.of(context).textTheme.displayLarge,
      )));
    }
  }
}
