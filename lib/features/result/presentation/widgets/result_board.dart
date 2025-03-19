import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/core/components/box_container.dart';
import 'package:math_skill_up/features/result/model/result_model.dart';
import 'package:math_skill_up/features/result/service/result_service.dart';

class ResultBoard extends ConsumerWidget {
  const ResultBoard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ResultService resultService = ref.read(resultServiceProvider);
    ResultSummary? resultSummary = resultService.calResultSummary();

    //TODO: to be removed
    resultSummary ??= ResultSummary(
      totalTime: 100000,
      averageTime: 10000,
      timeChange: -250,
      totalQuestions: 10,
      correctQuestions: 8,
      averageAccuracy: 0.2,
      accuracyChange: 0.1,
    );

    if (resultSummary == null) {
      return Center(
        child: Text("결과가 없습니다."),
      );
    }

    return Row(
      children: [
        TimeItem(
          totalTime: resultSummary.totalTime,
          averageTime: resultSummary.averageTime,
          timeChange: resultSummary.timeChange,
        ),
        SizedBox(width: 14),
        AccuracyItem(
          totalQuestions: resultSummary.totalQuestions,
          correctQuestions: resultSummary.correctQuestions,
          averageAccuracy: resultSummary.averageAccuracy,
          accuracyChange: resultSummary.accuracyChange,
        ),
      ],
    );
  }
}

class AccuracyItem extends StatelessWidget {
  final int totalQuestions;
  final int correctQuestions;
  final double averageAccuracy;
  final double accuracyChange;

  const AccuracyItem({
    super.key,
    required this.totalQuestions,
    required this.correctQuestions,
    required this.averageAccuracy,
    required this.accuracyChange,
  });

  @override
  Widget build(BuildContext context) {
    return ResultBoardItem(
      title: "정답",
      valueDisplay: AccuracyDisplay(
        totalQuestions: totalQuestions,
        correctQuestions: correctQuestions,
      ),
      average: averageAccuracy * 100,
      unit: "%",
      change: accuracyChange * 100,
    );
  }
}

class AccuracyDisplay extends StatelessWidget {
  final int totalQuestions;
  final int correctQuestions;

  const AccuracyDisplay({
    super.key,
    required this.totalQuestions,
    required this.correctQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$correctQuestions',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          TextSpan(
            text: ' / $totalQuestions',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}

class TimeItem extends StatelessWidget {
  final double totalTime;
  final double averageTime;
  final double timeChange;

  const TimeItem({
    super.key,
    required this.totalTime,
    required this.averageTime,
    required this.timeChange,
  });

  @override
  Widget build(BuildContext context) {
    return ResultBoardItem(
      title: "시간",
      valueDisplay: TotalTimeDisplay(totalTime: totalTime / 1000),
      average: averageTime / 1000,
      unit: "s",
      change: timeChange / 1000,
    );
  }
}

class TotalTimeDisplay extends StatelessWidget {
  final double totalTime;

  const TotalTimeDisplay({
    super.key,
    required this.totalTime,
  });

  @override
  Widget build(BuildContext context) {
    int minutes = (totalTime / 60).floor();
    double seconds = (totalTime % 60);

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$minutes',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          TextSpan(
            text: 'm ',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          TextSpan(
            text: seconds.toStringAsFixed(1),
            style: Theme.of(context).textTheme.displayLarge,
          ),
          TextSpan(
            text: 's',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}

class ResultBoardItem extends StatelessWidget {
  final String title;
  final Widget valueDisplay;
  final double average;
  final String unit;
  final double change;

  const ResultBoardItem({
    super.key,
    required this.title,
    required this.valueDisplay,
    required this.average,
    required this.unit,
    required this.change,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1, // 1:1 비율(정사각형)
        child: BoxContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              SizedBox(height: 5),
              valueDisplay,
              SizedBox(height: 10),
              AverageDisplay(
                averageTime: average,
                unit: unit,
              ),
              AverageChangeDisplay(
                change: change,
                unit: unit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AverageDisplay extends StatelessWidget {
  final double averageTime;
  final String unit;

  const AverageDisplay(
      {super.key, required this.averageTime, required this.unit});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '평균 ',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          TextSpan(
            text: averageTime.toStringAsFixed(1),
            style: Theme.of(context).textTheme.displayLarge,
          ),
          TextSpan(
            text: unit,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}

class AverageChangeDisplay extends StatelessWidget {
  final double change;
  final String unit;

  const AverageChangeDisplay({
    super.key,
    required this.change,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    String sign = change > 0 ? "+" : "";

    return Text(
      "$sign $change$unit",
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
