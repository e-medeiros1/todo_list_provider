import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart' as Storage;
import 'package:todo_list_provider/app/core/widgets/todo_error_message.dart';

class LocalStorage {
  Future set(String key, String? data) async {
    const storage = Storage.FlutterSecureStorage();
    try {
      storage.write(key: key, value: data);
    } catch (e, s) {
      final errorMessage = "Erro ao guardar dados: $data";
      log(errorMessage, error: e, stackTrace: s);
      throw TodoErrorMessage(message: errorMessage);
    }
  }

  Future<String?> get(String key) async {
    const storage = Storage.FlutterSecureStorage();
    try {
      return await storage.read(key: key);
    } catch (e, s) {
      final errorMessage = "Erro ao ler dados: $key";
      log(errorMessage, error: e, stackTrace: s);
      throw TodoErrorMessage(message: errorMessage);
    }
  }

  Future clearTodo(String key) async {
    const storage = Storage.FlutterSecureStorage();
    try {
      return await storage.delete(key: key);
    } catch (e, s) {
      const errorMessage = "Erro ao excluir dados";
      log(errorMessage, error: e, stackTrace: s);
      throw TodoErrorMessage(message: errorMessage);
    }
  }
}
