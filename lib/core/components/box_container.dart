import 'package:flutter/material.dart';
import 'package:math_skill_up/core/theme/app_colors.dart';
import 'package:math_skill_up/core/theme/app_theme_mode.dart';

class BoxContainer extends StatelessWidget implements PreferredSizeWidget {
  const BoxContainer(
      {super.key, this.width = 300, this.height = 300, required this.child});

  final double width;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: AppThemeMode.current,
      builder: (BuildContext context, bool value, Widget? childWidget) {
        return Container(
          decoration: BoxDecoration(
            color: value
                ? AppColors.lightBoxContainerColor
                : AppColors.darkBoxContainerColor,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          width: width,
          height: height,
          child: childWidget, // 전달된 child를 여기서 렌더링
        );
      },
      child: child, // 전달된 child를 childWidget으로 제공
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
