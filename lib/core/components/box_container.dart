import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/core/components/error_component.dart';
import 'package:math_skill_up/core/components/loading_indicator.dart';
import 'package:math_skill_up/core/theme/app_colors.dart';
import 'package:math_skill_up/core/theme/constants.dart';
import 'package:math_skill_up/core/theme/app_theme_controller.dart';

class BoxContainer extends ConsumerWidget {
  const BoxContainer(
      {super.key, this.width = 300, this.height = 300, required this.child});

  final double width;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTheme = ref.watch(appThemeController);
    return asyncTheme.when(
        data: (theme) => Container(
              decoration: BoxDecoration(
                color: theme == lightMode
                    ? AppColors.lightBoxContainerColor
                    : AppColors.darkBoxContainerColor,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              width: width,
              height: height,
              child: child,
            ),
        error: (e, st) => ErrorComponent(error: e),
        loading: () => const LoadingIndicator());
  }
}
