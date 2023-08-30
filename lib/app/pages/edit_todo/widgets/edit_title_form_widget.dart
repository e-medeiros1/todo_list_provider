// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/styles/colors_style.dart';

class EditTitleFormWidget extends StatelessWidget {
  final FocusNode titleFocus;
  final FocusNode contentFocus;
  final String? initialValue;

  const EditTitleFormWidget(
      {super.key,
      required this.titleFocus,
      required this.contentFocus,
      this.initialValue});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: context.colors.secondary,
      initialValue: initialValue,
      style: TextStyle(
        color: context.colors.secondary,
      ),
      focusNode: titleFocus,
      decoration: InputDecoration(
        label: Text(
          'Título',
          style: TextStyle(
            fontSize: 16,
            color: context.colors.secondary,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: const TextStyle(fontSize: 14),
        labelStyle: TextStyle(
          color: context.colors.secondary,
        ),
      ),
      maxLines: 1,
      textCapitalization: TextCapitalization.words,
      onFieldSubmitted: (_) => contentFocus.requestFocus(),
      validator: (String? title) {
        if (title == null || title.isEmpty) {
          return 'Você precisa adicionar um título';
        }
        return null;
      },
    );
  }
}
