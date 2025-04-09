import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/core/components/common_scaffold.dart';
import 'package:math_skill_up/features/history/presentation/history_chart.dart';
import 'package:math_skill_up/features/history/presentation/history_list.dart';
import 'package:math_skill_up/features/history/presentation/history_setting_bar.dart';
import 'package:math_skill_up/features/history/service/history_service.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CommonScaffold(
      titleText: 'History',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HistorySettingBar(),
          const SizedBox(height: 16),
          OptionalHistoryChart(),
          const SizedBox(height: 16),
          Expanded(child: HistoryList()),
        ],
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
