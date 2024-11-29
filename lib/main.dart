import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:math_skill_up/core/theme/app_theme_data.dart';
import 'package:math_skill_up/core/theme/app_theme_mode.dart';

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
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: AppThemeMode.themeMode,
        builder: (context, mode, child) {
          return MaterialApp.router(
            routerConfig: router,
            darkTheme: AppThemeData.dark,
            theme: AppThemeData.light,
            themeMode: mode,
          );
        });
  }
}
