import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/core/theme/app_colors.dart';

class MemoBox extends ConsumerWidget {
  const MemoBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: AppColors.white,
      child: Row(
        children: [
          Text(
            "Memo",
            style: Theme.of(context).textTheme.displayLarge,
          )
        ],
      ),
    );
  }
}
