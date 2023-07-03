import 'package:datum/utils/theme_style.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        appName,
        style: ThemeStyle.largeText,
      ),
      backgroundColor: ThemeStyle.barColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
