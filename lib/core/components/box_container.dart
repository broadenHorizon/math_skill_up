import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoxContainer extends ConsumerWidget {
  const BoxContainer(
      {super.key, this.width = 300, this.height = 300, required this.child});

  final double width;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      width: width,
      height: height,
      child: child,
    );
  }
}
