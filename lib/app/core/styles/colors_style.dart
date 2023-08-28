import 'package:flutter/material.dart';

class ColorsStyle {
  static ColorsStyle? _instance;
  final _primaryColor = const Color(0XFF373F51);
  final _secondaryColor = const Color(0xFFD8DBE2);
  final _blackColor = const Color(0XFFA9BCD0);

  ColorsStyle._();

  static ColorsStyle get instance {
    _instance ??= ColorsStyle._();
    return _instance!;
  }

  Color get primary => _primaryColor;
  Color get secondary => _secondaryColor;
  Color get black => _blackColor;
}

extension ColorsStyleExtensions on BuildContext {
  ColorsStyle get colors => ColorsStyle.instance;
}
