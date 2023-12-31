import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/styles/colors_style.dart';
import 'package:todo_list_provider/app/core/widgets/todo_texts.dart';

class TodoFormField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focus;
  final String label;
  final bool autoFocus;
  final TextCapitalization textCapitalization;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final int? maxLines;
  final int? minLines;
  final void Function()? onTap;
  final bool readOnly;
  final TextInputAction textInputAction;
  final String? initialValue;

  const TodoFormField({
    super.key,
    required this.controller,
    required this.focus,
    required this.label,
    this.autoFocus = false,
    this.textCapitalization = TextCapitalization.none,
    this.validator,
    this.onFieldSubmitted,
    this.maxLines,
    this.minLines,
    this.onTap,
    this.readOnly = false,
    this.textInputAction = TextInputAction.next,
    this.initialValue = '',
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      focusNode: focus,
      textCapitalization: textCapitalization,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      maxLines: maxLines,
      minLines: minLines,
      onTap: onTap,
      readOnly: readOnly,
      autofocus: autoFocus,
      cursorColor: context.colors.secondary,
      style: TextStyle(color: context.colors.secondary),
      initialValue: initialValue,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: TodoTexts(text: label, fontSize: 16),
        floatingLabelStyle: const TextStyle(fontSize: 14),
        labelStyle: TextStyle(
          color: context.colors.secondary,
        ),
      ),
    );
  }
}
