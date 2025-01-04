import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/core/theme/app_colors.dart';

class BlankBox extends ConsumerWidget {
  const BlankBox({super.key, this.width = 50});

  final double width;

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
      width: width, // TextField 넓이
      height: 50,
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
    );
  }
}
