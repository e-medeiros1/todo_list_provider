import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/controllers/todo_controller.dart';
import 'package:todo_list_provider/app/core/widgets/todo_checkbox.dart';
import 'package:todo_list_provider/app/core/widgets/todo_texts.dart';

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});

  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  bool isLoading = true;
  String? hasError;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadAllTodos();
    });
    super.initState();
  }

  Future loadAllTodos() async {
    isLoading = true;
    hasError = null;
    final controller = context.read<TodoController>();

    final String? errorLoadingTodos = await controller.loadTodos();
//Caso não carregue, substitua pela call da instancia de controller
    final String? errorLoadingDoneTodos = await controller.loadDoneTodos();

    if (errorLoadingTodos != null || errorLoadingDoneTodos != null) {
      setState(() {
        hasError = errorLoadingTodos ?? errorLoadingDoneTodos;
      });
    }
    setState(() {
      isLoading = false;
        
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<TodoController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Minhas tarefas',
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Consumer(
        builder: (context, value, child) {
          return FutureBuilder(
            future: controller.loadTodos(),
            builder: (context, snapshot) => ListView.builder(
              itemCount: controller.todoList.length,
              itemBuilder: (context, index) {
                final todo = controller.todoList[index];
                return ListTile(
                  leading: TodoCheckbox(todo: todo),
                  title: TodoTexts(text: todo.title, fontSize: 18),
                  subtitle:
                      TodoTexts(text: todo.description ?? '', fontSize: 14),
                  trailing: TodoTexts(
                      text: todo.date.toIso8601String(), fontSize: 14),
                );
              },
            ),
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
