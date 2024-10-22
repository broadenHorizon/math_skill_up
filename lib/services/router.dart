import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:math_skill_up/features/basic_calculation/presentation/basic_calculation_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  final router = GoRouter(
    initialLocation: '/basic-calulation',
    routes: [
      GoRoute(
        path: '/basic-calulation',
        builder: (_, __) => const BasicCalculationPage(),
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
}
