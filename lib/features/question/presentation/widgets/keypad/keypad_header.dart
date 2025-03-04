import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/core/theme/app_colors.dart';
import 'package:math_skill_up/features/home/service/home_service.dart';
import 'package:math_skill_up/features/question_setting/model/question_setting_model.dart';

class KeypadHeader extends ConsumerWidget {
  const KeypadHeader(
      {super.key, required this.keypadType, required this.toggleKeypadType});
  final String keypadType;
  final Function toggleKeypadType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeService = ref.read(homeServiceProvider);
    final settings = homeService.getSettingsData();
    return Container(
      height: 50,
      margin: const EdgeInsets.only(bottom: 6),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.gray200)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          settings.questionType == QuestionType.alphabet &&
                  keypadType != "alphabetpad"
              ? IconButton(
                  onPressed: () {
                    toggleKeypadType("alphabetpad");
                  },
                  icon: const Icon(Icons.text_format,
                      size: 36, color: AppColors.black))
              : Container(),
          IconButton(
            icon: Icon(
              keypadType == "calculatepad"
                  ? Icons.expand
                  : Icons.calculate_outlined,
              size: 36,
              color: AppColors.black,
            ),
            onPressed: () {
              toggleKeypadType(
                  keypadType == "calculatepad" ? "numberpad" : "calculatepad");
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
