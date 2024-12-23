import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/features/question/model/quiestion_model.dart';
import 'package:math_skill_up/features/question/presentation/widgets/question_box/basic_question_box.dart';
import 'package:math_skill_up/features/question/presentation/widgets/question_box/fraction_question_box.dart';
import 'package:math_skill_up/features/question/repository/questions_list_repository.dart';

class QuestionBox extends ConsumerWidget {
  const QuestionBox({super.key, required this.target});

  final int target;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionList =
        ref.watch(questionsListRepositoryProvider.notifier).questionsList;

    if (questionList is List<BasicOperationQuestion>) {
      return BasicQuestionBox(question: questionList[target]);
    } else if (questionList is List<FractionOperationQuestion>) {
      return FractionQuestionBox(question: questionList[target]);
    }
    return SizedBox(
        child: Text(
      "Question",
      style: Theme.of(context).textTheme.displayLarge,
    ));
  }
}
