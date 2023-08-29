import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/controllers/todo_controller.dart';
import 'package:todo_list_provider/app/core/styles/colors_style.dart';
import 'package:todo_list_provider/app/mixin/mixin_snack_bar.dart';
import 'package:todo_list_provider/app/models/todo_model.dart';
import 'package:todo_list_provider/app/pages/edit_todo/widgets/content_form_widget.dart';
import 'package:todo_list_provider/app/pages/edit_todo/widgets/date_form_widget.dart';
import 'package:todo_list_provider/app/pages/edit_todo/widgets/edit_title_form_widget.dart';

class EditTodoScreen extends StatefulWidget {
  final String title;
  final String content;
  final String date;
  final String id;

  const EditTodoScreen(
      {super.key,
      required this.title,
      required this.content,
      required this.date,
      required this.id});

  @override
  State<EditTodoScreen> createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> with MixinSnackBar {
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

  void editTodo() async {
    if (formKey.currentState!.validate()) {
      final controller = context.read<TodoController>();
      final String? error = await controller.editTodo(
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
            title: const Text('Editar tarefa'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    EditTitleFormWidget(
                      titleFocus: _titleFocus,
                      contentFocus: _contentFocus,
                      initialValue: widget.title,
                    ),
                    const SizedBox(height: 20),
                    EditContentFormWidget(
                      contentFocus: _contentFocus,
                      dateFocus: _dateFocus,
                      initialValue: widget.content,
                    ),
                    const SizedBox(height: 20),
                    EditDateFormWidget(
                      initialValue: widget.date,
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
            onPressed: () => editTodo(),
            label: Text('Atualizar tarefa',
                style: TextStyle(color: context.colors.primary, fontSize: 15)),
          ),
        ),
      ),
    );
  }
}
