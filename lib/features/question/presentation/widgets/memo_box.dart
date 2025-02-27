import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:math_skill_up/core/theme/app_colors.dart';
import 'package:math_skill_up/features/home/service/home_service.dart';
import 'package:math_skill_up/features/question/repository/current_question_repository.dart';
import 'package:math_skill_up/features/question/repository/timer_repository.dart';
import 'package:math_skill_up/features/question/repository/user_answer_repository.dart';
import 'package:math_skill_up/features/question/util/common_util.dart';
import 'package:math_skill_up/features/result/repository/result_list_repository.dart';

class MemoBox extends ConsumerStatefulWidget {
  const MemoBox(
      {super.key,
      required this.flexRatio,
      required this.target,
      required this.onExpandChanged});

  final double flexRatio;
  final int target;
  final ValueChanged<bool> onExpandChanged;

  @override
  MemoBoxState createState() => MemoBoxState();
}

class MemoBoxState extends ConsumerState<MemoBox> {
  late FocusNode _focusNode;
  bool _isExpanded = false;
  bool _isSmallSubmitButton = true;

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
    _isSmallSubmitButton = widget.flexRatio < 1.8;
    final homeService = ref.read(homeServiceProvider);
    final settings = homeService.getSettingsData();
    final resultListRepository =
        ref.read(resultListRepositoryProvider.notifier);
    final currentQuestion =
        ref.read(currentQuestionRepositoryProvider.notifier);
    final userAnswer = ref.read(userAnswerRepositoryProvider.notifier);

    void submitHandler() {
      final timeTaken = ref.read(timerRepositoryProvider.notifier).stopTimer();

      resultListRepository.addResult(
          currentQuestion.getQuestion(), timeTaken, userAnswer.getUserAnswer());
      if (convertQuestionCountToInt(settings.questionCount) <=
          widget.target + 1) {
        context.go('/result');
      } else {
        context.go('/question?id=${widget.target + 1}');
      }
    }

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
                if (_isSmallSubmitButton)
                  Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: submitHandler,
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
          if (!_isSmallSubmitButton)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: submitHandler,
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
