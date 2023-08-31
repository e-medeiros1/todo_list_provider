import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/styles/colors_style.dart';
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
          backgroundColor: context.colors.secondary,
          duration: const Duration(seconds: 2),
          content: TodoTexts(
              text: text, fontSize: 14, colorText: context.colors.primary),
        ),
      );
  }
}
