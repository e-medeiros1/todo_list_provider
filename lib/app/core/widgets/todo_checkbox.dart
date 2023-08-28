import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/controllers/todo_controller.dart';
import 'package:todo_list_provider/app/core/styles/colors_style.dart';
import 'package:todo_list_provider/app/mixin/mixin_snack_bar.dart';

import '../../models/todo_model.dart';

class TodoCheckbox extends StatelessWidget with MixinSnackBar {
  final TodoModel todo;
  const TodoCheckbox({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<TodoController>();
    return Checkbox(
      side: BorderSide(color: context.colors.secondary),
      checkColor: context.colors.secondary,
      focusColor: context.colors.secondary,
      value: controller.isTodoChecked(todo.id),
      onChanged: (bool? changed) async {
        final String? error = await controller.checkTodo(todo.id);

        if (error != null && context.mounted) {
          showSnackBar(text: error, context: context, isError: true);
        }
      },
    );
  }
}
