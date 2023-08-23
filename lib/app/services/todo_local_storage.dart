import 'dart:convert';
import 'dart:developer';

import 'package:todo_list_provider/app/core/widgets/todo_error_message.dart';
import 'package:todo_list_provider/app/core/widgets/todo_messages.dart';
import 'package:todo_list_provider/app/services/local_storage.dart';

import '../models/todo_model.dart';

class TodoLocalStorage {
  final LocalStorage _localStorage;
  final String todosKey = "todos";

  TodoLocalStorage(this._localStorage);

  Future<String?> setTodos(List<TodoModel> todos) async {
    try {
      final String data = jsonEncode(
        todos.map((todo) => todo.toMap()).toList(),
      );

      await _localStorage.set(todosKey, data);

      return null;
    } on TodoErrorMessage {
      return "Erro ao salvar tarefas";
    } catch (e) {
      log('Erro ao salvar ToDo\'s');
      return defaultErrorMessage;
    }
  }

  Future<(String? error, List<TodoModel>? todos)> getTodos() async {
    try {
      final String? todosJson = await _localStorage.get(todosKey);

      if (todosJson != null) {
        final todos = (jsonDecode(todosJson) as List)
            .map<TodoModel>(
              (todo) => TodoModel.fromMap(todo),
            )
            .toList();

        return (null, todos);
      }

      return (null, <TodoModel>[]);
      
    } on TodoErrorMessage {
      return ("Erro ao salvar tarefas", null);
    } catch (e) {
      log('Erro ao salvar ToDo\'s');
      return (defaultErrorMessage, null);
    }
  }
}
