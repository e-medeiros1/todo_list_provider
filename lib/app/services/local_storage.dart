import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart' as Storage;
import 'package:todo_list_provider/app/core/widgets/todo_error_message.dart';

class LocalStorage {
  static const storage = Storage.FlutterSecureStorage();

  Future set(String key, String? data) async {
    try {
      await storage.write(key: key, value: data);
    } catch (e, s) {
      final errorMessage = "Erro ao guardar dados: $data";
      log(errorMessage, error: e, stackTrace: s);
      throw TodoErrorMessage(message: errorMessage);
    }
  }

  Future get(String key) async {
    try {
      await storage.read(key: key);
    } catch (e, s) {
      final errorMessage = "Erro ao ler dados: $key";
      log(errorMessage, error: e, stackTrace: s);
      throw TodoErrorMessage(message: errorMessage);
    }
  }

  Future clearStorage() async {
    try {
      return await storage.deleteAll();
    } catch (e, s) {
      const errorMessage = "Erro ao excluir dados";
      log(errorMessage, error: e, stackTrace: s);
      throw TodoErrorMessage(message: errorMessage);
    }
  }
}
