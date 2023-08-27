import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/widgets/todo_texts.dart';

mixin MixinSnackBar {
  void showSnackBar(
      {required String text,
      required BuildContext context,
      bool isError = false}) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: TodoTexts(text: text, fontSize: 14),
        ),
      );
  }
}
