import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/core/theme/app_colors.dart';
import 'package:math_skill_up/features/home/service/home_service.dart';
import 'package:math_skill_up/features/question/repository/timer_repository.dart';
import 'package:math_skill_up/features/question/util/common_util.dart';

class QuestionAppBar extends ConsumerStatefulWidget {
  const QuestionAppBar({super.key, required this.target});

  final int target;

  @override
  QuestionAppBarState createState() => QuestionAppBarState();
}

class QuestionAppBarState extends ConsumerState<QuestionAppBar> {
  @override
  void initState() {
    super.initState();
    ref.read(timerRepositoryProvider.notifier).startTimer();
  }

  @override
  void didUpdateWidget(covariant QuestionAppBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.target != widget.target) {
      ref.read(timerRepositoryProvider.notifier).startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    final time = ref.watch(timerRepositoryProvider);
    final homeService = ref.read(homeServiceProvider);

    return Container(
      height: 60,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.gray200)),
          color: AppColors.white),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20), // 왼쪽 여백
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  ref.read(timerRepositoryProvider.notifier).stopTimer();
                  context.go('/home');
                },
              ),
            ),
          ),
          Center(
            child: Text(
              "${widget.target}/${convertQuestionCountToInt(homeService.getSettingsData().questionCount)}",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20), // 오른쪽 여백
              child: Text(
                "${time}s",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
