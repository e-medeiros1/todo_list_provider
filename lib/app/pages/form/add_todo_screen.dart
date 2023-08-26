import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/widgets/todo_texts.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(size: 25),
          title: const TodoTexts(text: 'Criar tarefa', fontSize: 22),
          centerTitle: true,
        ),
        body: Container(),
      ),
    );
  }
}
