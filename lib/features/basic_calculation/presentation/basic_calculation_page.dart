import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BasicCalculationPage extends ConsumerWidget {
  const BasicCalculationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text("calculation"),
    );
  }
}
