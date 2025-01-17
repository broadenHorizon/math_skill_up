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
    _isExpanded = widget.flexRatio > 1.5;

    return Container(
      color: AppColors.white,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 30,
            child: Stack(
              children: [
                Center(
                  child: IconButton(
                    onPressed: () => widget.onExpandChanged(!_isExpanded),
                    icon: Icon(_isExpanded
                        ? Icons.arrow_drop_down
                        : Icons.arrow_drop_up),
                    iconSize: 36,
                    visualDensity: VisualDensity.compact,
                  ),
                ),
                if (!_isExpanded)
                  Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.check_circle,
                          color: AppColors.primary,
                        ),
                        iconSize: 30,
                      )),
              ],
            ),
          ),
          if (_isExpanded)
            Expanded(
              child: TextField(
                focusNode: _focusNode,
                decoration: InputDecoration(
                  hintText: _focusNode.hasFocus ? '' : 'Write here...',
                  border: InputBorder.none,
                ),
                maxLines: null,
                readOnly: true,
                showCursor: _focusNode.hasFocus,
              ),
            ),
          if (_isExpanded)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary),
                child: Text(
                  'SUBMIT',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: AppColors.offWhite, // 텍스트 색상 변경
                      ),
                ),
              ),
            ),
          SizedBox(height: 6),
        ],
      ),
    );
  }
}
