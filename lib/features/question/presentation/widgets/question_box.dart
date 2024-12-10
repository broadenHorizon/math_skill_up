import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/features/home/service/home_service.dart';
import 'package:math_skill_up/features/question/model/quiestion_model.dart';
import 'package:math_skill_up/features/question/repository/questions_list_repository.dart';

class QuestionBox extends ConsumerWidget {
  const QuestionBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List questionList = ref.read(questionsListRepositoryProvider);
    if (questionList is List<BasicOperationQuestion>) {
      // questionList type을 BasicOperationQuestion으로 캐스팅
      return Container(
        child: Text(
            '${questionList[0].firstNum} ${questionList[0].operator} ${questionList[0].secondNum}'),
      );
    }
    return SizedBox(
        child: Text(
      "Question",
      style: Theme.of(context).textTheme.displayLarge,
    ));
  }
}
