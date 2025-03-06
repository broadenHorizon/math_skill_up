import 'package:flutter/material.dart';
import 'package:math_skill_up/core/components/app_bar.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(titleText: '결과'),
    );
  }
}
