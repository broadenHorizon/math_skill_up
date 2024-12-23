import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/core/theme/app_colors.dart';
import 'package:math_skill_up/features/question/model/quiestion_model.dart';
import 'package:math_skill_up/features/question/util/basic_operation_util.dart';

class BasicQuestionBox extends ConsumerWidget {
  const BasicQuestionBox({super.key, required this.question});

  final BasicOperationQuestion question;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FocusNode focusNode = FocusNode();
    Color borderColor = AppColors.gray300;

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        borderColor = AppColors.gray400; // 포커스 시 border 색상 변경
      } else {
        borderColor = AppColors.gray300; // 포커스 해제 시 기본 색상으로 복원
      }
      // 상태를 업데이트하기 위해 setState를 호출해야 합니다.
      (context as Element).markNeedsBuild();
    });
    return Container(
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.gray200)),
            color: AppColors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${question.firstNum}',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(width: 10), // Text 사이에 마진 추가
            Text(
              getDisplayOperatorWord(question.operator),
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(width: 10), // Text 사이에 마진 추가
            Text(
              '${question.secondNum}',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(width: 10), // Text 사이에 마진 추가
            Text(
              '=',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(width: 10), // = 기호와 TextField 사이 간격
            Container(
              width: 120, // TextField 넓이
              decoration: BoxDecoration(
                border: Border.all(color: borderColor),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                focusNode: focusNode, // FocusNode 추가
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: AppColors.gray300),
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
          ],
        ));
  }
}
