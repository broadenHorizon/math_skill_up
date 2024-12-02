import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/core/theme/constants.dart';
import 'package:math_skill_up/services/theme.dart';

final appThemeController = AsyncNotifierProvider<AppThemeController, String>(
    () => AppThemeController());

class AppThemeController extends AsyncNotifier<String> {
  @override
  Future<String> build() async {
    return await ref.read(themeServiceProvider).initTheme();
  }

  String get currentMode => state.value ?? lightMode;

  void toggle() async {
    state = const AsyncValue.loading();

    final mode = currentMode == lightMode ? darkMode : lightMode;
    state = await AsyncValue.guard(
      () async {
        ref.read(themeServiceProvider).toggleTheme(mode);

        return mode;
      },
    );
  }
}
