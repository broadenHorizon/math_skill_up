import 'package:flutter/material.dart';

class LogoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LogoAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'FastMath',
        style: Theme.of(context).textTheme.displayLarge,
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0, // 앱바 투명
    );
  }

  // AppBar의 크기 설정 (필수)
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
