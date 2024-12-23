import 'package:flutter/material.dart';
import 'package:math_skill_up/core/theme/app_colors.dart';

class ExpandedMemoBox extends StatelessWidget {
  const ExpandedMemoBox(
      {super.key, required this.isExpanded, required this.onExpandChanged});

  final bool isExpanded;
  final ValueChanged<bool> onExpandChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          IconButton(
            onPressed: () => onExpandChanged(!isExpanded),
            icon: Icon(isExpanded ? Icons.close : Icons.arrow_upward),
          ),
          if (isExpanded)
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
