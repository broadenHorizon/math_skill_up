import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/core/theme/app_colors.dart';

class BlankBox extends ConsumerStatefulWidget {
  const BlankBox({super.key, this.width = 50});

  final double width;

  @override
  BlankBoxState createState() => BlankBoxState();
}

class BlankBoxState extends ConsumerState<BlankBox> {
  late FocusNode _focusNode;
  Color _borderColor = AppColors.gray300;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _borderColor =
            _focusNode.hasFocus ? AppColors.gray400 : AppColors.gray300;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width, // TextField 넓이
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: _borderColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        focusNode: _focusNode, // FocusNode 추가
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintStyle: TextStyle(color: AppColors.gray300),
          contentPadding: EdgeInsets.all(10),
        ),
        readOnly: true,
        showCursor: _focusNode.hasFocus, // 포커스가 있을 때만 커서 보이게 설정
      ),
    );
  }
}
