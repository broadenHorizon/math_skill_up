import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:math_skill_up/core/components/expanded_text_botton.dart';
import 'package:math_skill_up/features/home/model/question_type_model.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class QuestionTypeCard extends StatelessWidget {
  final QuestionTypeModel questionTypeModel;

  const QuestionTypeCard({super.key, required this.questionTypeModel});

  @override
  Widget build(BuildContext context) {
    // Hive에서 데이터를 가져옴

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 0,
      color: Theme.of(context).colorScheme.primaryContainer,
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
                    '${questionTypeModel.type}   |   ${questionTypeModel.count}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            ExpandedTextBotton(
              onPressed: () {
                context.push('/question-setting');
              },
              text: '변경하기',
            ),
          ],
        ),
      ),
    );
  }
}
