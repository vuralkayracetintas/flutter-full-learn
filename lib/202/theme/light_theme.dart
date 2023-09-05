import 'package:flutter/material.dart';

class LightTheme {
  final _lightColor = _LightColor();
  late ThemeData theme;
  LightTheme() {
    theme = ThemeData(
        appBarTheme: const AppBarTheme(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(50)))),
        scaffoldBackgroundColor: Colors.white.withOpacity(0.8),
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(backgroundColor: Colors.green),
        buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.light(
            onPrimary: Colors.purple,
            onSecondary: _lightColor.blueMenia,
          ),
        ),
        colorScheme: const ColorScheme.light(),
        checkboxTheme: CheckboxThemeData(
            fillColor: MaterialStateProperty.all(Colors.blue),
            side: const BorderSide(color: Colors.purple)),
        textTheme: ThemeData.light().textTheme.copyWith(
            titleMedium:
                TextStyle(fontSize: 30, color: _lightColor._textColor)));
  }
}

class _LightColor {
  final Color _textColor = Colors.black;
  final Color blueMenia = const Color.fromARGB(95, 188, 248, 1);
  final Color colorRed1 = Colors.yellow;
}
