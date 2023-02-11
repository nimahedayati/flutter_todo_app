import 'package:flutter/material.dart';
import 'package:flutter_todo_app/app/extensions.dart';
import 'package:flutter_todo_app/data/models/todo.dart';
import 'package:flutter_todo_app/presentation/resources/color_manager.dart';
import 'package:flutter_todo_app/presentation/resources/font_manager.dart';
import 'package:flutter_todo_app/presentation/resources/styles_manager.dart';
import 'package:flutter_todo_app/presentation/resources/values_manager.dart';
import 'package:flutter_todo_app/presentation/widgets/app_rounded_checkbox.dart';

class AppTodoItem extends StatefulWidget {
  const AppTodoItem({super.key, required this.todo});

  final Todo todo;

  @override
  State<AppTodoItem> createState() => _AppTodoItemState();
}

class _AppTodoItemState extends State<AppTodoItem> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => setState(() => check = !check),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: SizeValueManager.s8),
          height: SizeValueManager.s48,
          child: Row(children: [
            AppRoundedCheckbox(checked: check, onChanged: (value) => setState(() => check = value)),
            Expanded(
                child: AnimatedDefaultTextStyle(
                    duration: DurationValueManager.d200,
                    style: check
                        ? getRegularStyle(color: ColorManager.lightGray).copyWith(decoration: TextDecoration.lineThrough)
                        : getRegularStyle(color: ColorManager.onBackground),
                    child: Text(widget.todo.title))),
            AnimatedDefaultTextStyle(
                duration: DurationValueManager.d200,
                style: check
                    ? getRegularStyle(color: ColorManager.lightGray, fontSize: FontSizeManager.s10)
                        .copyWith(decoration: TextDecoration.lineThrough)
                    : getRegularStyle(color: ColorManager.onBackground, fontSize: FontSizeManager.s10),
                child: Text(widget.todo.formatedTime)),
            SizeValueManager.s12.width,
          ])),
    );
  }

  @override
  void initState() {
    check = widget.todo.finished;
    super.initState();
  }
}
