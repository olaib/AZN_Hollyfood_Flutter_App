import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/theme_provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) => GestureDetector(
            onTap: () {
              themeProvider.toggleTheme();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
