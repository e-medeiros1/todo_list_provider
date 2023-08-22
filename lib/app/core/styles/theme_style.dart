import 'package:flutter/material.dart';

import 'colors_style.dart';

class ThemeStyle {
  ThemeStyle._();

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.grey[400]!),
  );
  static final _defaultFocusedInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: ColorsStyle.instance.blue),
  );

  static final theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsStyle.instance.primary,
      elevation: 0,
      iconTheme: IconThemeData(
        color: ColorsStyle.instance.secondary,
        size: 30,
        weight: 100,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsStyle.instance.primary,
      primary: ColorsStyle.instance.primary,
      secondary: ColorsStyle.instance.secondary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(20),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultFocusedInputBorder,
    ),
  );
}
