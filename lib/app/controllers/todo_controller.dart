import 'package:flutter/material.dart';

import '../models/todo_model.dart';
import '../services/todo_local_storage.dart';

class TodoController extends ChangeNotifier {
  //1. Fazer injeção de dependências
  //2. Criar listas de todos
  //3. Carregar todos usando Records e instância do localStorage
  //4. Faz tratamento de null safety e preenche a lista
  //5. Faz um sort pra ordenar os todos
  //
  //6. Carrega done todos
  //Repete o mesmo processo
  //
  //Cria método para CRUD dos Todos com o gerenciador de estado que preferir
  //Salva todos no localStorage

  final TodoLocalStorage _todoLocalStorage;

  TodoController(this._todoLocalStorage);

  final List<TodoModel> todoList = [];
  final List<String> doneTodoList = [];

  Future<String?> loadTodos() async {
    final (String? error, List<TodoModel>? loadedTodos) =
        await _todoLocalStorage.getTodos();

    if (error == null) {
      todoList
        ..clear()
        ..addAll(loadedTodos!);

      sortTodosByDate();
    }
    return error;
  }

  void sortTodosByDate() {
    todoList.sort((a, b) => a.date.compareTo(b.date));
    notifyListeners();
  }

  Future<String?> loadDoneTodos() async {
    final (String? error, List<String>? loadedDoneTodos) =
        await _todoLocalStorage.getDoneTodos();

    if (error == null) {
      doneTodoList
        ..clear()
        ..addAll(loadedDoneTodos!);
    }
    return error;
  }

  Future<String?> saveTodos() async {
    return _todoLocalStorage.setTodos(todoList);
  }

  Future<String?> addTodo(TodoModel todoModel) async {
    todoList.add(todoModel);
    final String? error = await saveTodos();

    if (error == null) {
      sortTodosByDate();
      notifyListeners();
    }
    return error;
  }

  // Future deleteTodos(String id) async {
  //   final error = await _todoLocalStorage.deleteTodos(id);

  //   notifyListeners();

  //   return error;
  // }

  bool isTodoChecked(String id) {
    return doneTodoList.indexWhere((checkedTodoId) => checkedTodoId == id) !=
        -1;
  }

  Future<String?> checkTodo(String id) async {
    if (!isTodoChecked(id)) {
      doneTodoList.add(id);
    } else {
      doneTodoList.removeWhere((checkedTodoId) => checkedTodoId == id);
    }

    final String? error = await _todoLocalStorage.setDoneTodos(doneTodoList);

    if (error == null) {
      if (isTodoChecked(id)) {
        doneTodoList.add(id);
      } else {
        doneTodoList.removeWhere((checkedTodoId) => checkedTodoId == id);
      }

      notifyListeners();
    }

    return error;
  }
}
