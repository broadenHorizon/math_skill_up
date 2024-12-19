import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/core/theme/app_colors.dart';
import 'package:math_skill_up/features/question/presentation/widgets/keypad/keypad_header.dart';

class KeypadBox extends ConsumerWidget {
  const KeypadBox({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: height,
      color: AppColors.white,
      child: Column(
        children: [
          const KeypadHeader(),
          Text(
            "Keypad",
            style: Theme.of(context).textTheme.displayLarge,
          )
        ],
      ),
    );
  }
}
