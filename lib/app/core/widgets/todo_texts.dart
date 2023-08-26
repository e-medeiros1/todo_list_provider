// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TodoTexts extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign? textAlign;

  const TodoTexts({
    Key? key,
    required this.text,
    required this.fontSize,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize),
      textAlign: textAlign,
    );
  }
}
