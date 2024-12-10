import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/features/question/presentation/widgets/keypad/keypad_box.dart';
import 'package:math_skill_up/features/question/presentation/widgets/memo_box.dart';
import 'package:math_skill_up/features/question/presentation/widgets/question_app_bar.dart';
import 'package:math_skill_up/features/question/presentation/widgets/question_box.dart';

class QuestionPage extends ConsumerWidget {
  const QuestionPage(this.id, {super.key});

  final String id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const QuestionAppBar(), // SafeArea로 인해 노치를 고려한 위치에 배치
            Expanded(
              child: Column(
                children: [
                  QuestionBox(target: int.parse(id)),
                  const MemoBox(),
                ],
              ),
            ),
            const KeypadBox(),
          ],
        ),
      ),
    );
  }
}
