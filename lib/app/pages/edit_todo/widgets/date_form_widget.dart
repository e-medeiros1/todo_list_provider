// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/styles/colors_style.dart';

// ignore: must_be_immutable
class EditDateFormWidget extends StatelessWidget {
  final FocusNode dateFocus;
  String? initialValue = '';

  final void Function(DateTime date) setDate;

  EditDateFormWidget(
      {super.key,
      required this.dateFocus,
      required this.setDate,
      this.initialValue});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: context.colors.secondary,
      focusNode: dateFocus,
      style: TextStyle(
        color: context.colors.secondary,
      ),
      decoration: InputDecoration(
        label: Text(
          'Data',
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
      readOnly: true,
      initialValue: initialValue,
      validator: (String? newTodoDate) {
        if (newTodoDate == null || newTodoDate.isEmpty) {
          return 'Você precisa adicionar uma data';
        }
        return null;
      },
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
        initialValue = stringDate;
      },
    );
  }
}
