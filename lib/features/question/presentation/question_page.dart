import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/features/question/presentation/widgets/keypad/keypad_box.dart';
import 'package:math_skill_up/features/question/presentation/widgets/memo_box.dart';
import 'package:math_skill_up/features/question/presentation/widgets/question_app_bar.dart';
import 'package:math_skill_up/features/question/presentation/widgets/question_box.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage(this.id, {super.key});

  final String id;
  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage>
    with SingleTickerProviderStateMixin {
  bool _isMemoExpanded = false;
  late AnimationController _controller;
  late Animation<double> _questionBoxHeight;
  late Animation<double> _memoBoxHeight;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _questionBoxHeight = Tween<double>(
      begin: 300.0,
      end: 100.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _memoBoxHeight = Tween<double>(
      begin: 50.0,
      end: 200.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleMemoExpanded(bool isExpanded) {
    setState(() {
      _isMemoExpanded = isExpanded;
      if (_isMemoExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const QuestionAppBar(),
            Expanded(
              child: Column(
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return QuestionBox(
                        target: int.parse(widget.id),
                        height: _questionBoxHeight.value,
                      );
                    },
                  ),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return ExpandedMemoBox(
                        height: _memoBoxHeight.value,
                        onExpandChanged: (isExpanded) =>
                            _toggleMemoExpanded(isExpanded),
                      );
                    },
                  ),
                ],
              ),
            ),
            const KeypadBox(),
          ],
        ),
      ),
    );
  }
}
