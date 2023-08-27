import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/widgets/todo_texts.dart';
import 'package:todo_list_provider/app/pages/form/widgets/todo_form_field.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(size: 25),
          title: const TodoTexts(text: 'Criar tarefa', fontSize: 22),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TodoFormField(
                    autoFocus: true,
                    controller: titleController,
                    focus: FocusNode(canRequestFocus: true),
                    label: 'Título',
                  ),
                  const SizedBox(height: 20),
                  TodoFormField(
                    controller: contentController,
                    focus: FocusNode(),
                    label: 'Descrição',
                    maxLines: 5,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: const TodoTexts(
                      text: 'Salvar',
                      fontSize: 16,
                      colorText: Colors.black87,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
