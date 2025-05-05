import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/features/question/repository/current_focus_repository.dart';
import 'package:math_skill_up/features/question/repository/memo_repository.dart';
import 'package:math_skill_up/features/question/repository/user_answer_repository.dart';

class AlphabetpadBox extends ConsumerWidget {
  const AlphabetpadBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? currentFocus = ref.watch(currentFocusRepositoryProvider);

    final rows = [
      ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
      ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
      ['Z', 'X', 'C', 'V', 'B', 'N', 'M'],
      ['enter', 'blank', 'delete'],
    ];

    Widget buildKey(String key) {
      final userAnswer = ref.read(userAnswerRepositoryProvider.notifier);
      final memo = ref.read(memoRepositoryProvider.notifier);

      String display = switch (key) {
        'delete' => '⌫',
        'blank' => '⎵',
        'enter' => '⏎',
        'spacer' => '',
        _ => key,
      };

      void handleKeyPress() {
        if (key == 'spacer') return;
        if (currentFocus == 'answer') {
          String prev = userAnswer.getUserAnswer();
          switch (key) {
            case 'delete':
              userAnswer.setUserAnswer(
                  prev.isNotEmpty ? prev.substring(0, prev.length - 1) : prev);
              break;
            case 'blank':
              userAnswer.setUserAnswer(prev + ' ');
              break;
            case 'enter':
              userAnswer.setUserAnswer(prev + '\n');
              break;
            default:
              userAnswer.setUserAnswer(prev + key);
          }
        } else if (currentFocus == 'memo') {
          String prev = memo.getMemo();
          switch (key) {
            case 'delete':
              memo.setMemo(
                  prev.isNotEmpty ? prev.substring(0, prev.length - 1) : prev);
              break;
            case 'blank':
              memo.setMemo(prev + ' ');
              break;
            case 'enter':
              memo.setMemo(prev + '\n');
              break;
            default:
              memo.setMemo(prev + key);
          }
        }
      }

      if (key == 'spacer') {
        return const Expanded(child: SizedBox.shrink());
      }

      return Expanded(
        flex: key == 'blank' ? 2 : 1, // blank는 더 넓게
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: ElevatedButton(
            onPressed: handleKeyPress,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child:
                  Text(display, style: Theme.of(context).textTheme.titleLarge),
            ),
          ),
        ),
      );
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: rows
              .map((row) => Row(
                    children: row.map(buildKey).toList(),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
