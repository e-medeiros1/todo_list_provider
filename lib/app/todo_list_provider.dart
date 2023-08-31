import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/controllers/todo_controller.dart';
import 'package:todo_list_provider/app/pages/home/todo_home_page.dart';
import 'package:todo_list_provider/app/services/local_storage.dart';
import 'package:todo_list_provider/app/services/todo_local_storage.dart';

import 'core/styles/theme_style.dart';

class TodoListProvider extends StatelessWidget {
  const TodoListProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoController(TodoLocalStorage(LocalStorage())),
      child: MaterialApp(
        title: 'Meus afazeres',
        theme: ThemeStyle.theme,
        home: const TodoHomePage(),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: const [Locale('pt', 'BR')],
      ),
    );
  }
}
