import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/features/question/repository/current_focus_repository.dart';
import 'package:math_skill_up/features/question/repository/memo_repository.dart';
import 'package:math_skill_up/features/question/repository/user_answer_repository.dart';

const specialKeys = [
  'plus',
  'minus',
  'multiply',
  'divide',
  'equal',
  'delete',
  'enter',
  'blank'
];

class CalculatepadBox extends ConsumerWidget {
  const CalculatepadBox({super.key});

  String getKey(String target) {
    switch (target) {
      case "multiply":
        return "×";
      case "divide":
        return "÷";
      case "plus":
        return "+";
      case "minus":
        return "-";
      case "equal":
        return "=";
      case "delete":
        return "⌫";
      case "enter":
        return "⏎";
      case "blank":
        return "⎵";
      default:
        return target;
    }
  }

  String getInputText(String prevText, String inputText) {
    switch (inputText) {
      case "multiply":
        return "$prevText×";
      case "divide":
        return "$prevText÷";
      case "plus":
        return "$prevText+";
      case "minus":
        return "$prevText-";
      case "equal":
        return "$prevText=";
      case "delete":
        return prevText.substring(0, prevText.length - 1);
      case "enter":
        return "$prevText\n";
      case "blank":
        return "$prevText ";
      default:
        return prevText + inputText;
    }
  }

  bool validateSpecialKey(String key) {
    return specialKeys.contains(key);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? currentFocus = ref.watch(currentFocusRepositoryProvider);
    final buttons = [
      "plus",
      "minus",
      "multiply",
      "divide",
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
      "blank",
      '.',
      '0',
      "equal",
    ];

    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0), // 양쪽에 16px 마진 추가
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 1.9,
        ),
        itemCount: buttons.length,
        itemBuilder: (context, index) {
          final userAnswer = ref.read(userAnswerRepositoryProvider.notifier);
          final memo = ref.read(memoRepositoryProvider.notifier);
          return ElevatedButton(
            onPressed: () {
              if (currentFocus == 'answer') {
                if (validateSpecialKey(buttons[index]) &&
                    buttons[index] != "delete") {
                  return;
                }
                String prevAnswer = userAnswer.getUserAnswer();
                String resultAnswer = getInputText(prevAnswer, buttons[index]);
                userAnswer.setUserAnswer(resultAnswer);
              } else if (currentFocus == 'memo') {
                String prevMemo = memo.getMemo();
                String resultMemo = getInputText(prevMemo, buttons[index]);
                memo.setMemo(resultMemo);
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
              getKey(buttons[index]),
              style: Theme.of(context).textTheme.displayMedium,
            ),
          );
        },
      ),
    ));
  }
}
