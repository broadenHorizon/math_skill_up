import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/core/components/line_item.dart';
import 'package:math_skill_up/features/history/model/history_model.dart';
import 'package:math_skill_up/features/history/service/history_service.dart';

/// 비동기 데이터(Riverpod) 처리 담당
class HistoryList extends ConsumerWidget {
  const HistoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncHistories = ref.watch(historyNotifierProvider);

    return asyncHistories.when(
      data: (histories) {
        // 리스트가 비어있는 경우
        if (histories.isEmpty) {
          return const Center(
            child: Text('기록이 없습니다.'),
          );
        }
        // 데이터가 있는 경우, 실제 리스트 위젯 반환
        return HistoryListView(histories: histories);
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(
        child: Text('Error: $err'),
      ),
    );
  }
}

/// 실제 리스트 UI 그리기 담당
class HistoryListView extends StatelessWidget {
  final List<History> histories;

  const HistoryListView({
    super.key,
    required this.histories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        final itemWidth = (constraints.maxWidth - 9) / 3;

        return Column(
          children: [
            HistoryHeader(itemWidth: itemWidth),
            Expanded(
              child: ListView.builder(
                itemCount: histories.length,
                itemBuilder: (context, index) {
                  return HistoryLine(
                    itemWidth: itemWidth,
                    history: histories[index],
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}

class HistoryHeader extends StatelessWidget {
  final double itemWidth;

  const HistoryHeader({
    super.key,
    required this.itemWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LineItem(
          width: itemWidth,
          historyItemPosition: LineItemPosition.left,
          text: "날짜",
          isHeader: true,
        ),
        LineItem(
          width: itemWidth,
          historyItemPosition: LineItemPosition.middle,
          text: "평균 시간",
          isHeader: true,
        ),
        LineItem(
          width: itemWidth,
          historyItemPosition: LineItemPosition.right,
          text: "정답률",
          isHeader: true,
        ),
      ],
    );
  }
}

class HistoryLine extends StatelessWidget {
  final double itemWidth;
  final History history;

  const HistoryLine({
    super.key,
    required this.itemWidth,
    required this.history,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LineItem(
          width: itemWidth,
          historyItemPosition: LineItemPosition.left,
          text: history.formattedDate,
        ),
        LineItem(
          width: itemWidth,
          historyItemPosition: LineItemPosition.middle,
          text: '${(history.elapsedTime / 1000).toStringAsFixed(2)}s',
        ),
        LineItem(
          width: itemWidth,
          historyItemPosition: LineItemPosition.right,
          text: '${(history.accuracy * 100).toStringAsFixed(2)}%',
        ),
      ],
    );
  }
}
