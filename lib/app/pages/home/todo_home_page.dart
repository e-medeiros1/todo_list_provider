import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';
import 'package:todo_list_provider/app/controllers/todo_controller.dart';
import 'package:todo_list_provider/app/core/styles/colors_style.dart';
import 'package:todo_list_provider/app/core/widgets/todo_checkbox.dart';
import 'package:todo_list_provider/app/core/widgets/todo_texts.dart';
import 'package:todo_list_provider/app/mixin/mixin_snack_bar.dart';
import 'package:todo_list_provider/app/pages/add_todo/add_todo_screen.dart';

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});

  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> with MixinSnackBar {
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(size: 25),
          title: const TodoTexts(text: 'Lista de afazeres', fontSize: 22),
          centerTitle: true,
        ),
        body: isLoading
            ? SkeletonListView()
            : controller.todoList.isEmpty
                ? Center(
                    child: TodoTexts(
                        text: hasError != null
                            ? 'Erro ao carregar lista'
                            : 'Você não possui nenhuma tarefa',
                        fontSize: 18),
                  )
                : ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      indent: 10,
                      endIndent: 10,
                      color: context.colors.secondary.withOpacity(.3),
                    ),
                    itemCount: controller.todoList.length,
                    itemBuilder: (context, index) {
                      final todo = controller.todoList[index];
                      final dateFormatted =
                          "${todo.date.day.toString()}/${todo.date.month.toString().padLeft(2, '0')}/${todo.date.year.toString().padLeft(2, '0')}";
                      return InkWell(
                        onLongPress: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: TodoTexts(
                                text: todo.title,
                                fontSize: 16,
                                colorText: context.colors.primary,
                              ),
                              content: TodoTexts(
                                text: "Deseja excluir tarefa?",
                                fontSize: 15,
                                colorText: context.colors.primary,
                              ),
                              actionsAlignment: MainAxisAlignment.spaceBetween,
                              actions: [
                                TextButton(
                                  child: TodoTexts(
                                    text: "Cancelar",
                                    fontSize: 16,
                                    colorText: context.colors.primary,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: TodoTexts(
                                    text: "Excluir",
                                    fontSize: 16,
                                    colorText: context.colors.primary,
                                  ),
                                  onPressed: () {
                                    controller.deleteTodos(todo.id);
                                    Navigator.of(context).pop();
                                    showSnackBar(
                                        text: 'Tarefa excluída com sucesso',
                                        context: context);
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                        child: ListTile(
                          leading: TodoCheckbox(todo: todo),
                          title: TodoTexts(
                            text: todo.title,
                            fontSize: 18,
                            textDecoration:
                                controller.doneTodoList.contains(todo.id)
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                          ),
                          subtitle: TodoTexts(
                            text: todo.description ?? '',
                            fontSize: 14,
                            textDecoration:
                                controller.doneTodoList.contains(todo.id)
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                          ),
                          trailing:
                              TodoTexts(text: dateFormatted, fontSize: 14),
                        ),
                      );
                    },
                  ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: hasError != null
              ? loadAllTodos
              : () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddTodoScreen(),
                    ),
                  ),
          label: Text(
            hasError != null ? 'Recarregar' : 'Nova Tarefa',
            style: TextStyle(color: context.colors.primary, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
