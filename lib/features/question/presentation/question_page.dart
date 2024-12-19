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
  late Animation<double> _questionBoxHeight;
  late Animation<double> _memoBoxHeight;

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
    final screenHeight = MediaQuery.of(context).size.height;
    final safeAreaPadding = MediaQuery.of(context).padding;
    final safeAreaHeight =
        screenHeight - safeAreaPadding.top - safeAreaPadding.bottom;

    final maxQuestionBoxHeight = safeAreaHeight -
        appBarHeight -
        paddingHeight -
        keypadHeight -
        minMemoBoxHeight;
    final maxMemoBoxHeight = safeAreaHeight -
        appBarHeight -
        paddingHeight -
        keypadHeight -
        minQuestionBoxHeight;

    _questionBoxHeight = Tween<double>(
      begin: maxQuestionBoxHeight,
      end: minQuestionBoxHeight,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _memoBoxHeight = Tween<double>(
      begin: minMemoBoxHeight,
      end: maxMemoBoxHeight,
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
            const QuestionAppBar(height: appBarHeight),
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
            )),
            const SizedBox(height: paddingHeight),
            const KeypadBox(
              height: keypadHeight,
            ),
          ],
        ),
      ),
    );
  }
}
