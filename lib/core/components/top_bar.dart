// TODO: 추후 삭제 -> 설정에서 다크모드 설정하는 방식으로 변경

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:math_skill_up/core/theme/app_colors.dart';
import 'package:math_skill_up/core/theme/constants.dart';
import 'package:math_skill_up/core/theme/app_theme_notifier.dart';

class TopBar extends ConsumerWidget implements PreferredSizeWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<String> theme = ref.watch(appThemeNotifierProvider);
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {
            HapticFeedback.mediumImpact();
            ref.read(appThemeNotifierProvider.notifier).toggle();
          },
          icon: Icon(
            theme.value == lightMode ? Icons.light_mode : Icons.dark_mode,
            color:
                theme.value == lightMode ? AppColors.black : AppColors.offWhite,
          ),
        )
      ],
    );
  }

  // TODO: app bar 높이 설정 (추후 변경 필요)
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
