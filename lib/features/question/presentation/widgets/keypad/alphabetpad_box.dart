import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/features/question/repository/current_focus_repository.dart';
import 'package:math_skill_up/features/question/repository/memo_repository.dart';
import 'package:math_skill_up/features/question/repository/user_answer_repository.dart';

class AlphabetpadBox extends ConsumerWidget {
  const AlphabetpadBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Text("AlphabetpadBox"),
    );
  }
}
