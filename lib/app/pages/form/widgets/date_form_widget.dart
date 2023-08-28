// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../core/widgets/todo_form_field.dart';

class DateFormWidget extends StatelessWidget {
  final TextEditingController dateController;
  final FocusNode dateFocus;

  const DateFormWidget(
      {super.key, required this.dateController, required this.dateFocus});

  @override
  Widget build(BuildContext context) {
    return TodoFormField(
      autoFocus: true,
      controller: dateController,
      focus: dateFocus,
      label: 'Data',
      readOnly: true,
    );
  }
}
