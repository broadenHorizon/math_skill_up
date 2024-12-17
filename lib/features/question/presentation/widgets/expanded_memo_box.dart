import 'package:flutter/material.dart';
import 'package:math_skill_up/core/theme/app_colors.dart';

class ExpandedMemoBox extends StatelessWidget {
  const ExpandedMemoBox(
      {super.key, required this.height, required this.onExpandChanged});

  final double height;
  final ValueChanged<bool> onExpandChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      width: double.infinity,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          IconButton(
            onPressed: () => onExpandChanged(height <= 100),
            icon: Icon(height > 100 ? Icons.close : Icons.arrow_upward),
          ),
          if (height > 100)
            Expanded(
              child: Column(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Write here...',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: null,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('SUBMIT'),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
