import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
