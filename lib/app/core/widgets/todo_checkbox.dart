import 'package:flutter/material.dart';

import '../../models/todo_model.dart';

class TodoCheckbox extends StatelessWidget {
  final TodoModel todo;
  const TodoCheckbox({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: false,
      onChanged: (value) {},
    );
  }
}
