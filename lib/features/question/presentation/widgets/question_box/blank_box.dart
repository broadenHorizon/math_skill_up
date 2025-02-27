import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/core/theme/app_colors.dart';
import 'package:math_skill_up/features/question/repository/current_focus_repository.dart';
import 'package:math_skill_up/features/question/repository/user_answer_repository.dart';

class BlankBox extends ConsumerStatefulWidget {
  const BlankBox({super.key, this.width = 50});

  final double width;

  @override
  BlankBoxState createState() => BlankBoxState();
}

class BlankBoxState extends ConsumerState<BlankBox> {
  late FocusNode _focusNode;
  late final TextEditingController _controller = TextEditingController();
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
      if (_focusNode.hasFocus) {
        ref.read(currentFocusRepositoryProvider.notifier).setFocus("answer");
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userAnswer = ref.watch(userAnswerRepositoryProvider);
    _controller.text = userAnswer;

    return Container(
      width: widget.width, // TextField 넓이
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: _borderColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        focusNode: _focusNode, // FocusNode 추가
        controller: _controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintStyle: TextStyle(color: AppColors.gray300),
          contentPadding: EdgeInsets.all(10),
        ),
        style: Theme.of(context).textTheme.titleLarge,
        readOnly: true,
        showCursor: _focusNode.hasFocus, // 포커스가 있을 때만 커서 보이게 설정
      ),
    );
  }
}
