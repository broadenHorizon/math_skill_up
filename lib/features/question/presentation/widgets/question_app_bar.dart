import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/core/theme/app_colors.dart';

class QuestionAppBar extends ConsumerWidget {
  const QuestionAppBar({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: height,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.gray200)),
          color: AppColors.white),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20), // 왼쪽 여백
              child: Text(
                "x",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          Center(
            child: Text(
              "3/10",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20), // 오른쪽 여백
              child: Text(
                "6.2s",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
