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
    borderSide: BorderSide(color: ColorsStyle.instance.secondary, width: 2),
  );

  static final theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: ColorsStyle.instance.primary,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle:
          TextStyle(color: ColorsStyle.instance.secondary, fontSize: 22),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: ColorsStyle.instance.secondary,
        size: 25,
        weight: 100,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsStyle.instance.primary,
      primary: ColorsStyle.instance.primary,
      secondary: ColorsStyle.instance.secondary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        color: ColorsStyle.instance.secondary,
      ),
      floatingLabelStyle: TextStyle(color: ColorsStyle.instance.secondary),
      hintStyle: TextStyle(color: ColorsStyle.instance.secondary),
      fillColor: ColorsStyle.instance.primary,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(20),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultFocusedInputBorder,
    ),
  );
}
