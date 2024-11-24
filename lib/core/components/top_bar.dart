// TODO: 추후 삭제 -> 설정에서 다크모드 설정하는 방식으로 변경

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_skill_up/core/theme/app_colors.dart';
import 'package:math_skill_up/core/theme/app_theme_mode.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: AppThemeMode.current,
        builder: (BuildContext context, bool value, Widget? child) {
          return AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  HapticFeedback.mediumImpact();
                  AppThemeMode.change();
                },
                icon: Icon(
                  value ? Icons.light_mode : Icons.dark_mode,
                  color: value ? AppColors.black : AppColors.offWhite,
                ),
              )
            ],
          );
        });
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
