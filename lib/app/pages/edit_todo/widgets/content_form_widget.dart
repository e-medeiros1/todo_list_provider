// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/styles/colors_style.dart';

class EditContentFormWidget extends StatelessWidget {
  final FocusNode contentFocus;
  final FocusNode dateFocus;
  final String? initialValue;

  const EditContentFormWidget(
      {super.key,
      required this.contentFocus,
      required this.dateFocus,
      this.initialValue});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: context.colors.secondary),
      cursorColor: context.colors.secondary,
      autofocus: true,
      focusNode: contentFocus,
      initialValue: initialValue,
      decoration: InputDecoration(
        label: Text(
          'Descrição',
          style: TextStyle(fontSize: 16, color: context.colors.secondary),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: const TextStyle(fontSize: 14),
        labelStyle: TextStyle(
          color: context.colors.secondary,
        ),
      ),
      minLines: 10,
      maxLines: 15,
      textCapitalization: TextCapitalization.sentences,
      onFieldSubmitted: (_) => dateFocus.requestFocus(),
    );
  }
}
