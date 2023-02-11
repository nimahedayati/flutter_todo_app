import 'package:flutter/material.dart';
import 'package:flutter_todo_app/app/extensions.dart';
import 'package:flutter_todo_app/data/models/todo.dart';
import 'package:flutter_todo_app/presentation/resources/color_manager.dart';
import 'package:flutter_todo_app/presentation/resources/font_manager.dart';
import 'package:flutter_todo_app/presentation/resources/styles_manager.dart';
import 'package:flutter_todo_app/presentation/resources/values_manager.dart';
import 'package:flutter_todo_app/presentation/widgets/app_card_view.dart';
import 'package:flutter_todo_app/presentation/widgets/app_todo_item.dart';

class TodoListScreen extends StatefulWidget {
  final List<Todo> todos;
  const TodoListScreen({super.key, required this.todos});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AppCardView(
          child: Column(children: [
        ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => AppTodoItem(todo: widget.todos[index]),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: widget.todos.length),
        const Divider(),
        Padding(
            padding: const EdgeInsets.all(SizeValueManager.s20),
            child: Row(children: [
              Text('5 items left', style: getRegularStyle(color: ColorManager.darkGray)),
              const Spacer(),
            ]))
      ])),
    ]);
  }
}
