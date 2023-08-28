// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../core/widgets/todo_form_field.dart';

class DateFormWidget extends StatelessWidget {
  final TextEditingController dateController;
  final FocusNode dateFocus;

  final void Function(DateTime date) setDate;

  const DateFormWidget(
      {super.key,
      required this.dateController,
      required this.dateFocus,
      required this.setDate});

  @override
  Widget build(BuildContext context) {
    return TodoFormField(
      autoFocus: true,
      controller: dateController,
      focus: dateFocus,
      label: 'Data',
      readOnly: true,
      validator: (String? newTodoDate) {
        if (newTodoDate == null || newTodoDate.isEmpty) {
          return 'Você precisa adicionar uma data';
        }
        return null;
      },
      // onFieldSubmitted: (_) => addTodo(),
      textInputAction: TextInputAction.send,
      onTap: () async {
        final DateTime? date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(
            const Duration(days: 365),
          ),
          helpText: 'Selecione uma data',
        );
        String stringDate = '';
        if (date != null) {
          setDate(date);
          stringDate =
              "${date.day.toString()}/${date.month.toString().padLeft(2, '0')}/${date.year.toString().padLeft(2, '0')}";
        }
        dateController.text = stringDate;
      },
    );
  }
}
