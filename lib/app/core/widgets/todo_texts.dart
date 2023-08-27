// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TodoTexts extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign? textAlign;
  final Color? colorText;

  const TodoTexts({
    Key? key,
    required this.text,
    required this.fontSize,
    this.textAlign,
    this.colorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, color: colorText),
      textAlign: textAlign,
    );
  }
}
