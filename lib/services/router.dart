import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:math_skill_up/features/basic_calculation/presentation/basic_calculation_page.dart';
import 'package:math_skill_up/features/history/presentation/history_screen.dart';
import 'package:math_skill_up/features/home/presentation/home_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  final router = GoRouter(
    initialLocation: '/', //TODO: 임시로 변경, home으로 변경되어야함
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => const HomeScreen(),
      ),
      GoRoute(
        path: '/basic-calulation',
        builder: (_, __) => const BasicCalculationPage(),
      ),
      GoRoute(
        path: '/history',
        builder: (_, __) => const HistoryPage(),
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
}
