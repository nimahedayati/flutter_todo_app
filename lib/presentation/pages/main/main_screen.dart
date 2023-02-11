import 'package:flutter/material.dart';
import 'package:flutter_todo_app/app/extensions.dart';
import 'package:flutter_todo_app/data/models/todo.dart';
import 'package:flutter_todo_app/presentation/pages/main/add_todo_screen.dart';
import 'package:flutter_todo_app/presentation/pages/main/todo_list_screen.dart';
import 'package:flutter_todo_app/presentation/resources/assets_manager.dart';
import 'package:flutter_todo_app/presentation/resources/color_manager.dart';
import 'package:flutter_todo_app/presentation/resources/font_manager.dart';
import 'package:flutter_todo_app/presentation/resources/strings_manager.dart';
import 'package:flutter_todo_app/presentation/resources/styles_manager.dart';
import 'package:flutter_todo_app/presentation/resources/values_manager.dart';
import 'package:flutter_todo_app/presentation/widgets/app_card_view.dart';
import 'package:flutter_todo_app/presentation/widgets/app_rounded_checkbox.dart';

class MainScreen extends StatefulWidget {
  static const String route = '/main';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool addingTodo = false;

  final List<Todo> todos = [
    Todo(title: 'Complete online JavaScript course', dateTime: DateTime.parse('2023-02-11 09:00:00'), finished: true),
    Todo(title: 'Jog around the park 3x', dateTime: DateTime.parse('2023-02-11 12:30:00'), finished: false),
    Todo(title: '10 minutes meditation', dateTime: DateTime.parse('2023-02-11 17:00:00'), finished: false),
    Todo(title: 'Read for 1 hour', dateTime: DateTime.parse('2023-02-11 17:10:00'), finished: false),
    Todo(title: 'Pick up groceries', dateTime: DateTime.parse('2023-02-11 16:10:00'), finished: false),
    Todo(title: 'Complete Todo App on Frontend Mentor', dateTime: DateTime.parse('2023-02-11 20:00:00'), finished: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
            height: double.infinity,
            child: Stack(
              children: [_buildHeader(), _buildBody().paddingAll(SizeValueManager.s20)],
            )));
  }

  Widget _buildBody() {
    return Column(children: [
      SizeValueManager.s48.height,
      _buildToolbar(),
      SizeValueManager.s28.height,
      _buildAddTodo(),
      SizeValueManager.s18.height,
      AnimatedSwitcher(
          duration: DurationValueManager.d500,
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          transitionBuilder: fadeAndSlideTransitionBuilder,
          layoutBuilder: stackLayoutBuilder,
          child: addingTodo
              ? AddTodoScreen(
                  onAdd: () {},
                  onBack: () {
                    FocusScope.of(context).unfocus();

                    setState(() => addingTodo = !addingTodo);
                  },
                )
              : TodoListScreen(todos: todos)),
    ]);
  }

  Widget _buildHeader() {
    return SizedBox(
        height: SizeValueManager.s224,
        width: double.infinity,
        child: Stack(children: [
          Container(decoration: BoxDecoration(gradient: GradientManager.primary)),
          Positioned.fill(child: Opacity(opacity: 0.25, child: Image.asset(ImageAssetsManager.mainBackground, fit: BoxFit.cover)))
        ]));
  }

  Widget _buildToolbar() {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Text(StringsManager.todoTitle, style: getBoldStyle(fontSize: FontSizeManager.s32, color: ColorManager.onPrimary)),
      const Spacer(),
      Text('11 February', style: getMediumStyle(fontSize: FontSizeManager.s16, color: ColorManager.onPrimary))
    ]);
  }

  Widget _buildAddTodo() {
    return AppCardView(
        padding: const EdgeInsets.symmetric(horizontal: SizeValueManager.s8),
        child: Row(children: [
          const AppRoundedCheckbox(checked: false),
          Expanded(
              child: TextField(
                  onTap: () {
                    setState(() => addingTodo = !addingTodo);
                  },
                  style: getRegularStyle(color: ColorManager.onSurface),
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Create a new todo…', hintStyle: getRegularStyle(color: ColorManager.darkGray)))),
        ]));
  }

  Widget fadeAndSlideTransitionBuilder(Widget child, Animation<double> animation) {
    return FadeTransition(
        opacity: animation,
        child: SlideTransition(
            position: animation.drive(Tween<Offset>(begin: const Offset(0.1, 0), end: const Offset(0, 0))),
            child: Align(alignment: Alignment.topCenter, child: child)));
  }

  Widget stackLayoutBuilder(Widget? currentChild, List<Widget> previousChildren) {
    return Stack(alignment: Alignment.topCenter, children: [...previousChildren, if (currentChild != null) currentChild]);
  }
}
