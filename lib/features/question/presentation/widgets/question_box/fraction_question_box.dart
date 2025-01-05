import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/features/question/model/quiestion_model.dart';
import 'package:math_skill_up/features/question/presentation/widgets/question_box/blank_box.dart';
import 'package:math_skill_up/features/question/presentation/widgets/question_box/fraction_widget.dart';
import 'package:math_skill_up/features/question_setting/model/question_setting_model.dart';

const double _blankBoxWidth = 50;

class FractionQuestionBox extends ConsumerWidget {
  const FractionQuestionBox({super.key, required this.question});

  final FractionOperationQuestion question;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(
                left:
                    MediaQuery.of(context).size.width / 6 - _blankBoxWidth / 2),
            child: question.type == FractionType.fraction
                ? FractionWidget(
                    fraction: question.firstFraction,
                  )
                : Text(
                    '${question.firstFraction.percent}%',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
          ),
        ),
        const Center(
          child: BlankBox(
            width: _blankBoxWidth,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
              padding:
                  EdgeInsets.only(right: MediaQuery.of(context).size.width / 6),
              child: FractionWidget(
                fraction: question.secondFraction,
              )),
        ),
      ],
    );
  }
}
