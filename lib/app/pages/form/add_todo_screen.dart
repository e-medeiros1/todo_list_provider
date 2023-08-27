import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/controllers/todo_controller.dart';
import 'package:todo_list_provider/app/core/widgets/todo_texts.dart';
import 'package:todo_list_provider/app/mixin/mixin_snack_bar.dart';
import 'package:todo_list_provider/app/models/todo_model.dart';
import 'package:todo_list_provider/app/pages/form/widgets/todo_form_field.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> with MixinSnackBar {
  final formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _titleFocus = FocusNode();
  final _contentController = TextEditingController();
  final _contentFocus = FocusNode();

  final _dateController = TextEditingController();
  final _dateFocus = FocusNode();

  late DateTime todoDate;

  @override
  void dispose() {
    _titleController.dispose();
    _titleFocus.dispose();
    _contentController.dispose();
    _contentFocus.dispose();
    _dateController.dispose();
    _dateFocus.dispose();
    super.dispose();
  }

  void addTodo() async {
    if (formKey.currentState!.validate()) {
      final controller = context.read<TodoController>();
      final String? error = await controller.addTodo(
        TodoModel(
          title: _titleController.text,
          description: _contentController.text,
          cDate: todoDate,
        ),
      );

      if (context.mounted) {
        if (error != null) {
          showSnackBar(text: error, context: context, isError: true);
        } else {
          Navigator.of(context).pop();
        }
      }
    }
  }

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
                    controller: _titleController,
                    focus: _titleFocus,
                    label: 'Título',
                  ),
                  const SizedBox(height: 20),
                  TodoFormField(
                    controller: _contentController,
                    focus: _contentFocus,
                    label: 'Descrição',
                    maxLines: 5,
                  ),
                  const SizedBox(height: 20),
                  TodoFormField(
                    controller: _dateController,
                    focus: _dateFocus,
                    label: 'Data',
                    maxLines: 1,
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
