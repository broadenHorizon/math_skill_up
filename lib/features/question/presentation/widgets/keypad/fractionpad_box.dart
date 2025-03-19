import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FractionpadBox extends ConsumerWidget {
  const FractionpadBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 340,
      child: Text("FractionpadBox"),
    );
  }
}
