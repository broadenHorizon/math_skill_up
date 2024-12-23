import 'package:flutter/material.dart';
import 'package:math_skill_up/features/question/presentation/widgets/keypad/keypad_box.dart';
import 'package:math_skill_up/features/question/presentation/widgets/expanded_memo_box.dart';
import 'package:math_skill_up/features/question/presentation/widgets/question_app_bar.dart';
import 'package:math_skill_up/features/question/presentation/widgets/question_box.dart';

const appBarHeight = 60.0;
const paddingHeight = 20.0;
const keypadHeight = 340.0;
const minMemoBoxHeight = 50.0;
const minQuestionBoxHeight = 100.0;

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
  late Animation<double> _questionBoxFlex;
  late Animation<double> _memoBoxFlex;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _questionBoxFlex = Tween<double>(
      begin: 4.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _memoBoxFlex = Tween<double>(
      begin: 1.0,
      end: 3.0,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const QuestionAppBar(),
            Expanded(
              child: Column(
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Expanded(
                        flex: (_questionBoxFlex.value * 1000).toInt(),
                        child: QuestionBox(
                          target: int.parse(widget.id),
                        ),
                      );
                    },
                  ),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Expanded(
                        flex: (_memoBoxFlex.value * 1000).toInt(),
                        child: ExpandedMemoBox(
                          isExpanded: _isMemoExpanded,
                          onExpandChanged: (isExpanded) =>
                              _toggleMemoExpanded(isExpanded),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const KeypadBox(),
          ],
        ),
      ),
    );
  }
}
