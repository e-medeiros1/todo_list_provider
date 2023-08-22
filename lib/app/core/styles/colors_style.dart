import 'package:flutter/material.dart';

class ColorsStyle {
  static ColorsStyle? _instance;
  final _primaryColor = const Color(0xFF9ff238);
  final _secondaryColor = const Color(0xFF454444);
  final _blackColor = const Color(0XFF140E0E);
  final _blueColor = const Color(0XFF0b3fa4);

  ColorsStyle._();

  static ColorsStyle get instance {
    _instance ??= ColorsStyle._();
    return _instance!;
  }

  Color get primary => _primaryColor;
  Color get secondary => _secondaryColor;
  Color get black => _blackColor;
  Color get blue => _blueColor;
}

extension ColorsStyleExtensions on BuildContext {
  ColorsStyle get colors => ColorsStyle.instance;
}