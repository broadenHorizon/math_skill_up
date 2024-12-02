import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:math_skill_up/core/components/error_component.dart';
import 'package:math_skill_up/core/components/loading_indicator.dart';
import 'package:math_skill_up/core/theme/constants.dart';
import 'package:math_skill_up/core/theme/app_theme_data.dart';
import 'package:math_skill_up/core/theme/app_theme_controller.dart';

import 'services/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final asyncTheme = ref.watch(appThemeController);
    return asyncTheme.when(
        data: (theme) => MaterialApp.router(
              routerConfig: router,
              theme:
                  (theme == lightMode) ? AppThemeData.light : AppThemeData.dark,
            ),
        error: (e, st) => ErrorComponent(error: e),
        loading: () => const Center(child: LoadingIndicator()));
  }
}
