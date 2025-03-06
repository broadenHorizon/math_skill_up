import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:math_skill_up/features/history/presentation/history_chart.dart';
import 'package:math_skill_up/features/history/presentation/history_list.dart';
import 'package:math_skill_up/features/history/presentation/history_setting_bar.dart';
import 'package:math_skill_up/features/history/service/history_service.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            top: 0, bottom: 16.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HistorySettingBar(),
            const SizedBox(height: 10),
            OptionalHistoryChart(),
            const SizedBox(height: 10),
            Expanded(child: HistoryList()),
          ],
        ),
      ),
    );
  }
}

class OptionalHistoryChart extends ConsumerWidget {
  const OptionalHistoryChart({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncHistories = ref.watch(historyNotifierProvider);
    return asyncHistories.when(
      data: (histories) => HistoryChart(histories: histories),
      loading: () => Center(child: CircularProgressIndicator()),
      error: (err, stack) => Text('Error: $err'),
    );
  }
}
