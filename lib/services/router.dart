import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:math_skill_up/features/basic_calculation/presentation/basic_calculation_page.dart';
import 'package:math_skill_up/features/history/presentation/history_screen.dart';
import 'package:math_skill_up/features/home/presentation/home_screen.dart';
import 'package:math_skill_up/features/question/presentation/question_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  final router = GoRouter(
    initialLocation: '/question', //TODO: 임시로 변경, home으로 변경되어야함
    routes: [
      GoRoute(
        path: '/basic-calulation',
        builder: (_, __) => const BasicCalculationPage(),
      ),
      GoRoute(
        path: '/history',
        builder: (_, __) => const HistoryPage(),
      ),
      GoRoute(
        path: '/question',
        builder: (_, state) =>
            QuestionPage(state.uri.queryParameters['id'] ?? "0"),
      ),
      GoRoute(
        path: '/home',
        builder: (_, __) => const HomeScreen(),
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
}
