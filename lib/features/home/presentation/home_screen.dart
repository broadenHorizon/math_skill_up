import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_skill_up/features/home/presentation/widgets/logo_app_bar.dart';
import 'package:math_skill_up/features/home/presentation/widgets/question_type_card.dart';
import 'package:math_skill_up/features/home/presentation/widgets/start_button.dart';
import 'package:math_skill_up/features/home/service/home_service.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeService = ref.watch(homeServiceProvider);

    return Scaffold(
      appBar: const LogoAppBar(),
      body: Column(
        children: [
          QuestionTypeCard(questionTypeModel: homeService.getSettingsDisplay()),
          const StartButton(),
        ],
      ),
    );
  }
}
