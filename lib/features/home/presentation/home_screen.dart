import 'package:flutter/material.dart';
import 'package:math_skill_up/features/home/presentation/widgets/logo_app_bar.dart';
import 'package:math_skill_up/features/home/presentation/widgets/question_type_card.dart';
import 'package:math_skill_up/features/home/presentation/widgets/start_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: LogoAppBar(),
      body: Column(
        children: [
          QuestionTypeCard(),
          StartButton(),
        ],
      ),
    );
  }
}
