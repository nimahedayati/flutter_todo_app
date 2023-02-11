import 'package:flutter/material.dart';
import 'package:flutter_todo_app/presentation/pages/main/main_screen.dart';
import 'package:flutter_todo_app/presentation/resources/routes_manager.dart';
import 'package:flutter_todo_app/presentation/resources/strings_manager.dart';
import 'package:flutter_todo_app/presentation/resources/theme_manager.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: StringsManager.todoTitle,
        theme: getApplicationTheme(),
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: MainScreen.route);
  }
}
