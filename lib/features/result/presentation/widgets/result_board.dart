import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/core/components/box_container.dart';

class ResultBoard extends ConsumerWidget {
  const ResultBoard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        ResultBoardItem(
          title: "시간",
          valueDisplay: Text("123"),
          averageDisplay: Text("123"),
          averageSubtitle: "123",
        ),
        SizedBox(width: 14),
        ResultBoardItem(
          title: "정답",
          valueDisplay: Text("123"),
          averageDisplay: Text("123"),
          averageSubtitle: "123",
        ),
      ],
    );
  }
}

class TimeItem extends StatelessWidget {
  const TimeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ResultBoardItem(
      title: "시간",
      valueDisplay: Text("123"),
      averageDisplay: Text("123"),
      averageSubtitle: "123",
    );
  }
}

class ResultBoardItem extends StatelessWidget {
  final String title;
  final Widget valueDisplay;
  final Widget averageDisplay;
  final String averageSubtitle;

  const ResultBoardItem({
    super.key,
    required this.title,
    required this.valueDisplay,
    required this.averageDisplay,
    required this.averageSubtitle,
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
              averageDisplay,
              Text(
                "+ $averageSubtitle",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
