import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/widgets/todo_checkbox.dart';
import 'package:todo_list_provider/app/core/widgets/todo_texts.dart';

import '../../models/todo_model.dart';

class TodoHomePage extends StatelessWidget {
  const TodoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TodoModel> todos = [
      TodoModel(title: 'Todo 1', description: 'Primeiro teste'),
      TodoModel(title: 'Todo 2', description: 'Segundo teste'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Minhas tarefas',
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final TodoModel todo = todos[index];
          return ListTile(
            leading: TodoCheckbox(todo: todo),
            title: TodoTexts(text: todo.title, fontSize: 18),
            subtitle: TodoTexts(text: todo.description ?? '', fontSize: 14),
            trailing:
                TodoTexts(text: todo.date.toIso8601String(), fontSize: 14),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const TodoTexts(text: 'NOVA TAREFA', fontSize: 16),
      ),
    );
  }
}
