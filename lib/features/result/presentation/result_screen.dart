import 'package:flutter/material.dart';
import 'package:math_skill_up/core/components/common_scaffold.dart';
import 'package:math_skill_up/features/result/presentation/widgets/result_board.dart';
import 'package:math_skill_up/features/result/presentation/widgets/result_list.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      titleText: '결과',
      child: Column(
        children: [
          ResultBoard(),
          SizedBox(height: 8),
          Expanded(child: ResultList()),
        ],
      ),
    );
  }
}
