import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/core/theme/app_colors.dart';
import 'package:math_skill_up/features/question/presentation/widgets/keypad/keypad_header.dart';

class KeypadBox extends ConsumerWidget {
  const KeypadBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttons = [
      '7',
      '8',
      '9',
      '4',
      '5',
      '6',
      '1',
      '2',
      '3',
      '.',
      '0',
      '⌫'
    ];
    return Container(
      height: 340,
      color: AppColors.white,
      child: Column(
        children: [
          const KeypadHeader(),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 2, // 정사각형 비율로 설정
              ),
              itemCount: buttons.length,
              itemBuilder: (context, index) {
                return ElevatedButton(
                  onPressed: () {
                    // 버튼 클릭 시 동작 추가
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  child: Text(
                    buttons[index],
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
