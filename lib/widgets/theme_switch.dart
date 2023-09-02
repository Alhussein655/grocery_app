import 'package:flutter/material.dart';
import 'package:grocey_app/provider/dark_theme_provider.dart';
import 'package:grocey_app/widgets/my_text_widget.dart';
import 'package:provider/provider.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    return SwitchListTile(
      activeColor: Colors.cyan,
      inactiveThumbColor: Colors.black,
      title: MyTextWidget(
        text: 'Theme',
        color: themeState.getDarkTheme ? Colors.white : Colors.black,
        textSize: 24,
        isTitle: true,
      ),
      secondary: themeState.getDarkTheme
          ? const Icon(Icons.dark_mode_outlined)
          : const Icon(Icons.light_mode_outlined),
      value: themeState.getDarkTheme,
      onChanged: (value) {
        themeState.setDarkTheme = value;
      },
    );
  }
}
