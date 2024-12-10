import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/features/home/service/home_service.dart';
import 'package:math_skill_up/features/question/model/quiestion_model.dart';
import 'package:math_skill_up/features/question/repository/questions_list_repository.dart';
import 'package:math_skill_up/features/question/util/basic_operation_util.dart';

class QuestionBox extends ConsumerWidget {
  const QuestionBox({super.key, required this.target});

  final int target;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List questionList = ref.read(questionsListRepositoryProvider);
    if (questionList is List<BasicOperationQuestion>) {
      // questionList type을 BasicOperationQuestion으로 캐스팅
      return SizedBox(
        height: 300,
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
