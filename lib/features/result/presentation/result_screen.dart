import 'package:flutter/material.dart';
import 'package:math_skill_up/core/components/app_bar.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(titleText: '결과'),
    );
  }
}
