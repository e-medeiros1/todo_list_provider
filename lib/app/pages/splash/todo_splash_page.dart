import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/helpers/size_extensions.dart';
import 'package:todo_list_provider/app/core/styles/colors_style.dart';
import 'package:todo_list_provider/app/core/widgets/todo_texts.dart';
import 'package:todo_list_provider/app/pages/home/todo_home_page.dart';

class TodoSplashPage extends StatefulWidget {
  const TodoSplashPage({super.key});

  @override
  State<TodoSplashPage> createState() => _TodoSplashPageState();
}

class _TodoSplashPageState extends State<TodoSplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25),
            Center(
              child: Image.asset('assets/to-do-list.png',
                  fit: BoxFit.cover, scale: 1.5),
            ),
            const SizedBox(height: 25),
            TodoTexts(
                text: 'Controle o que precisa',
                fontSize: context.percentHeight(.05)),
            TodoTexts(
                text:
                    'O jeito mais fácil de gerenciar sua lista de tarefas e na palma da sua mão',
                fontSize: context.percentHeight(.02),
                colorText: context.colors.black),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class SplashPageAnimation extends StatelessWidget {
  const SplashPageAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedSplashScreen(
        centered: true,
        splash: const TodoSplashPage(),
        nextScreen: const TodoHomePage(),
        splashTransition: SplashTransition.fadeTransition,
        duration: 2000,
        curve: Curves.easeIn,
        backgroundColor: context.colors.primary,
        splashIconSize: 800,
      ),
    );
  }
}
