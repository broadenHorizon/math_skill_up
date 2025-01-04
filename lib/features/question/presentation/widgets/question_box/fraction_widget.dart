import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/core/theme/app_colors.dart';
import 'package:math_skill_up/features/question/model/quiestion_model.dart';

class FractionWidget extends ConsumerWidget {
  const FractionWidget({super.key, required this.fraction});

  final Fraction fraction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          fraction.numerator.toString(),
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Container(
          width: 70,
          height: 2,
          color: AppColors.black,
          margin: const EdgeInsets.symmetric(vertical: 4),
        ),
        Text(
          fraction.denominator.toString(),
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}
