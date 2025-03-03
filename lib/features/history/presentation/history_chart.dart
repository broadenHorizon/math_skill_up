import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/features/history/model/history_model.dart';

class HistoryChart extends ConsumerStatefulWidget {
  final List<History> histories;
  const HistoryChart({
    super.key,
    required this.histories,
  });

  @override
  ConsumerState<HistoryChart> createState() => _HistoryChartState();
}

class _HistoryChartState extends ConsumerState<HistoryChart> {
  late TransformationController _transformationController;

  @override
  void initState() {
    _transformationController = TransformationController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const leftReservedSize = 52.0;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.4,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 0.0,
                right: 18.0,
              ),
              child: LineChart(
                transformationConfig: FlTransformationConfig(
                  scaleAxis: FlScaleAxis.horizontal,
                  minScale: 1.0,
                  maxScale: 25.0,
                  panEnabled: true,
                  scaleEnabled: true,
                  transformationController: _transformationController,
                ),
                LineChartData(
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(
                    show: true,
                    border: Border(
                      bottom: BorderSide(
                          color: Theme.of(context).colorScheme.outline,
                          width: 4),
                      left: const BorderSide(color: Colors.transparent),
                      right: const BorderSide(color: Colors.transparent),
                      top: const BorderSide(color: Colors.transparent),
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      gradient: LinearGradient(colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.onPrimary
                      ]),
                      spots: widget.histories.asMap().entries.map((e) {
                        return FlSpot(e.key.toDouble(), e.value.accuracy);
                      }).toList(),
                      dotData: FlDotData(
                        show: false,
                      ),
                      isStrokeCapRound: true,
                      barWidth: 5,
                      belowBarData: BarAreaData(
                        show: false,
                      ),
                      isCurved: false,
                    ),
                  ],
                  lineTouchData: LineTouchData(
                    touchSpotThreshold: 5,
                    getTouchLineStart: (_, __) => -double.infinity,
                    getTouchLineEnd: (_, __) => double.infinity,
                    getTouchedSpotIndicator:
                        (LineChartBarData barData, List<int> spotIndexes) {
                      return spotIndexes.map((spotIndex) {
                        return TouchedSpotIndicatorData(
                          FlLine(
                            color: Theme.of(context).colorScheme.primary,
                            strokeWidth: 1.5,
                            dashArray: [8, 2],
                          ),
                          FlDotData(
                            show: true,
                            getDotPainter: (spot, percent, barData, index) {
                              return FlDotCirclePainter(
                                radius: 6,
                                color: Theme.of(context).colorScheme.primary,
                                strokeWidth: 2,
                                strokeColor:
                                    Theme.of(context).colorScheme.primary,
                              );
                            },
                          ),
                        );
                      }).toList();
                    },
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                        return touchedBarSpots.map((barSpot) {
                          final history = widget.histories[barSpot.x.toInt()];
                          return LineTooltipItem(
                            '',
                            TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text:
                                    '${history.date.year}/${history.date.month}/${history.date.day}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              TextSpan(
                                  text:
                                      '\n${(history.accuracy * 100).toStringAsFixed(1)}%',
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                            ],
                          );
                        }).toList();
                      },
                      tooltipBorder: BorderSide.none,
                      getTooltipColor: (touchedSpot) =>
                          Theme.of(context).colorScheme.surface,
                    ),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    leftTitles: AxisTitles(
                      drawBelowEverything: true,
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: leftReservedSize,
                        maxIncluded: false,
                        minIncluded: false,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          // 0.87과 같은 값을 87%로 변환
                          final percentage = value * 100;
                          return SideTitleWidget(
                            meta: meta,
                            child: Text(
                              '${percentage.toStringAsFixed(0)}%',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall, // 원하는 스타일 적용
                            ),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 38,
                        maxIncluded: false,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          final date = widget.histories[value.toInt()].date;
                          return SideTitleWidget(
                            meta: meta,
                            child: Transform.rotate(
                              angle: -45 * 3.14 / 180,
                              child: Text(
                                '${date.month}/${date.day}',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                duration: Duration.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }
}
