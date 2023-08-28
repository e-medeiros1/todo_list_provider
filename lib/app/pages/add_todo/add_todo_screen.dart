import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/controllers/todo_controller.dart';
import 'package:todo_list_provider/app/core/styles/colors_style.dart';
import 'package:todo_list_provider/app/mixin/mixin_snack_bar.dart';
import 'package:todo_list_provider/app/models/todo_model.dart';
import 'package:todo_list_provider/app/pages/add_todo/widgets/content_form_widget.dart';
import 'package:todo_list_provider/app/pages/add_todo/widgets/date_form_widget.dart';
import 'package:todo_list_provider/app/pages/add_todo/widgets/title_form_widget.dart';

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
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Criar tarefa'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TitleFormWidget(
                      titleController: _titleController,
                      titleFocus: _titleFocus,
                      contentFocus: _contentFocus,
                    ),
                    const SizedBox(height: 20),
                    ContentFormWidget(
                      contentController: _contentController,
                      contentFocus: _contentFocus,
                      dateFocus: _dateFocus,
                    ),
                    const SizedBox(height: 20),
                    DateFormWidget(
                      dateController: _dateController,
                      dateFocus: _dateFocus,
                      setDate: (DateTime date) {
                        todoDate = date;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: addTodo,
            label: Text('Salvar tarefa',
                style: TextStyle(color: context.colors.primary, fontSize: 15)),
          ),
        ),
      ),
    );
  }
}
