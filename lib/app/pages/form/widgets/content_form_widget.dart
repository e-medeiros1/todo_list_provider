// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../core/widgets/todo_form_field.dart';

class ContentFormWidget extends StatelessWidget {
  final TextEditingController contentController;
  final FocusNode contentFocus;
  final FocusNode dateFocus;

  const ContentFormWidget(
      {super.key,
      required this.contentController,
      required this.contentFocus,
      required this.dateFocus});

  @override
  Widget build(BuildContext context) {
    return TodoFormField(
      autoFocus: true,
      controller: contentController,
      focus: contentFocus,
      label: 'Descrição',
      minLines: 4,
      maxLines: 6,
      textCapitalization: TextCapitalization.sentences,
      onFieldSubmitted: (_) => dateFocus.requestFocus(),
    );
  }
}
