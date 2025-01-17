import 'package:flutter/material.dart';
import 'package:math_skill_up/core/theme/app_colors.dart';

class MemoBox extends StatefulWidget {
  const MemoBox(
      {super.key, required this.flexRatio, required this.onExpandChanged});

  final double flexRatio;
  final ValueChanged<bool> onExpandChanged;

  @override
  MemoBoxState createState() => MemoBoxState();
}

class MemoBoxState extends State<MemoBox> {
  late FocusNode _focusNode;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _isExpanded = widget.flexRatio > 2.5;

    return Container(
      color: AppColors.white,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          IconButton(
            onPressed: () => widget.onExpandChanged(!_isExpanded),
            icon:
                Icon(_isExpanded ? Icons.arrow_drop_down : Icons.arrow_drop_up),
            iconSize: 36,
          ),
          if (_isExpanded)
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: TextField(
                      focusNode: _focusNode,
                      decoration: const InputDecoration(
                        hintText: 'Write here...',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: null,
                      readOnly: true,
                      showCursor: _focusNode.hasFocus,
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
