// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/styles/colors_style.dart';

class TodoTexts extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign? textAlign;
  final Color? colorText;
  final TextDecoration? textDecoration;

  const TodoTexts({
    Key? key,
    required this.text,
    required this.fontSize,
    this.textAlign,
    this.colorText,
    this.textDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: colorText ?? context.colors.secondary,
        decoration: textDecoration,
        decorationColor: context.colors.secondary,
      ),
      textAlign: textAlign,
    );
  }
}
