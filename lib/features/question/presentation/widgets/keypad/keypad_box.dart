import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/core/theme/app_colors.dart';
import 'package:math_skill_up/features/question/presentation/widgets/keypad/alphabetpad_box.dart';
import 'package:math_skill_up/features/question/presentation/widgets/keypad/calculatepad_box.dart';
import 'package:math_skill_up/features/question/presentation/widgets/keypad/fractionpad_box.dart';
import 'package:math_skill_up/features/question/presentation/widgets/keypad/keypad_header.dart';
import 'package:math_skill_up/features/question/presentation/widgets/keypad/numberpad_box.dart';

class KeypadBox extends ConsumerStatefulWidget {
  const KeypadBox({super.key});

  @override
  KeypadBoxState createState() => KeypadBoxState();
}

class KeypadBoxState extends ConsumerState<KeypadBox> {
  String keypadType = 'numberpad';

  void toggleKeypadType(String type) {
    setState(() {
      keypadType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      color: AppColors.white,
      child: keypadType == "fractionpad"
          ? const FractionpadBox()
          : Column(
              children: [
                KeypadHeader(
                  keypadType: keypadType,
                  toggleKeypadType: toggleKeypadType,
                ),
                keypadType == 'numberpad'
                    ? const NumberpadBox()
                    : keypadType == 'alphabetpad'
                        ? const AlphabetpadBox()
                        : const CalculatepadBox(),
              ],
            ),
    );
  }
}
