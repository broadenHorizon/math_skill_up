import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommonScaffold extends StatelessWidget {
  final Widget child;
  const CommonScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(titleText: '히스토리'),
      body: CommonBodyPadding(
        child: child,
      ),
    );
  }
}

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;

  const CommonAppBar({super.key, required this.titleText});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titleText, style: Theme.of(context).textTheme.displayLarge),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => context.pop(),
      ),
    );
  }
}

class CommonBodyPadding extends StatelessWidget {
  final Widget child;

  const CommonBodyPadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        bottom: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      child: child,
    );
  }
}
