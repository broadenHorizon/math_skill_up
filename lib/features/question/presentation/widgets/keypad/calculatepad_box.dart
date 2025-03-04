import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/features/question/repository/current_focus_repository.dart';
import 'package:math_skill_up/features/question/repository/memo_repository.dart';
import 'package:math_skill_up/features/question/repository/user_answer_repository.dart';

class CalculatepadBox extends ConsumerWidget {
  const CalculatepadBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? currentFocus = ref.watch(currentFocusRepositoryProvider);
    final buttons = [
      "+",
      "-",
      "×",
      "÷",
      '7',
      '8',
      '9',
      "delete",
      '4',
      '5',
      '6',
      "enter",
      '1',
      '2',
      '3',
      "enter",
      '.',
      '0',
      "=",
      "⌞⌟",
    ];

    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 2,
        ),
        itemCount: buttons.length,
        itemBuilder: (context, index) {
          final userAnswer = ref.read(userAnswerRepositoryProvider.notifier);
          final memo = ref.read(memoRepositoryProvider.notifier);
          return ElevatedButton(
            onPressed: () {
              if (currentFocus == 'answer') {
                String prevAnswer = userAnswer.getUserAnswer();
                if (buttons[index] == 'delete') {
                  userAnswer.setUserAnswer(
                      prevAnswer.substring(0, prevAnswer.length - 1));
                  return;
                }
                userAnswer.setUserAnswer(prevAnswer + buttons[index]);
              } else if (currentFocus == 'memo') {
                String prevMemo = memo.getMemo();
                if (buttons[index] == 'delete') {
                  memo.setMemo(prevMemo.substring(0, prevMemo.length - 1));
                  return;
                }
                memo.setMemo(prevMemo + buttons[index]);
              }
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            child: Text(
              buttons[index] == 'delete' ? '⌫' : buttons[index],
              style: Theme.of(context).textTheme.displayMedium,
            ),
          );
        },
      ),
    );
  }
}
