import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/core/components/line_item.dart';
import 'package:math_skill_up/features/result/model/result_model.dart';
import 'package:math_skill_up/features/result/repository/result_list_repository.dart';

/// 비동기 데이터(Riverpod) 처리 담당
class ResultList extends ConsumerWidget {
  const ResultList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final results = ref.watch(resultListRepositoryProvider);

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
            ResultHeader(itemWidth: itemWidth),
            Expanded(
              child: ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  return ResultLine(
                    itemWidth: itemWidth,
                    result: results[index],
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

class ResultHeader extends StatelessWidget {
  final double itemWidth;

  const ResultHeader({
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

class ResultLine extends StatelessWidget {
  final double itemWidth;
  final Result result;

  const ResultLine({
    super.key,
    required this.itemWidth,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LineItem(
          width: itemWidth,
          historyItemPosition: LineItemPosition.left,
          text: result.isCorrect ? "정답" : "오답",
        ),
        LineItem(
          width: itemWidth,
          historyItemPosition: LineItemPosition.middle,
          text: result.time.toStringAsFixed(2),
        ),
        LineItem(
          width: itemWidth,
          historyItemPosition: LineItemPosition.right,
          text: result.time.toStringAsFixed(2),
        ),
      ],
    );
  }
}
