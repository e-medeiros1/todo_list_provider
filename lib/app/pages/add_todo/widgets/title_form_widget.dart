// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../core/widgets/todo_form_field.dart';

class TitleFormWidget extends StatelessWidget {
  final TextEditingController titleController;
  final FocusNode titleFocus;
  final FocusNode contentFocus;

  const TitleFormWidget(
      {super.key,
      required this.titleController,
      required this.titleFocus,
      required this.contentFocus});

  @override
  Widget build(BuildContext context) {
    return TodoFormField(
      autoFocus: true,
      controller: titleController,
      focus: titleFocus,
      label: 'Título',
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
