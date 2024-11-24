import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:math_skill_up/core/components/box_container.dart';
import 'package:math_skill_up/core/components/top_bar.dart';

class BasicCalculationPage extends ConsumerWidget {
  const BasicCalculationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width; // 전체 화면 너비
    return Scaffold(
      appBar: const TopBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Column을 전체 너비로 설정
        children: [
          const SizedBox(height: 50), // 상단 여백
          Align(
              alignment: Alignment.center, // 가로로 중앙 정렬
              child: BoxContainer(
                width: screenWidth - 40,
                height: 300,
                child: Center(
                  child: Text(
                    "calculation",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
