import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:math_skill_up/features/history/presentation/history_chart.dart';
import 'package:math_skill_up/features/history/presentation/history_setting_bar.dart';
import 'package:math_skill_up/features/history/service/history_service.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // HistoryService를 통해 필터링된 히스토리 가져오기
    final historyService = ref.read(historyServiceProvider);
    final histories = historyService.getFilteredHistories();
    print("세팅 체인지");

    return Scaffold(
      appBar: AppBar(
        title: Text('히스토리', style: Theme.of(context).textTheme.displayLarge),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop(); // GoRouter의 pop 메서드
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 8.0, bottom: 16.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HistorySettingBar(),
            const SizedBox(height: 16),
            histories.isEmpty
                ? Center(
                    child: Text(
                      '히스토리가 없습니다.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  )
                : HistoryChart(histories: histories),
          ],
        ),
      ),
    );
  }
}
