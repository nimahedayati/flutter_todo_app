import 'package:flutter/material.dart';
import 'package:flutter_todo_app/app/extensions.dart';
import 'package:flutter_todo_app/presentation/resources/color_manager.dart';
import 'package:flutter_todo_app/presentation/resources/font_manager.dart';
import 'package:flutter_todo_app/presentation/resources/styles_manager.dart';
import 'package:flutter_todo_app/presentation/resources/values_manager.dart';

// ignore: constant_identifier_names
enum SlideTransitionAnimatation { UP, DOWN }

class AppTimePicker extends StatefulWidget {
  const AppTimePicker({super.key});

  @override
  State<AppTimePicker> createState() => _AppTimePickerState();
}

class _AppTimePickerState extends State<AppTimePicker> {
  int hour = 12;
  int min = 30;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      0.0.width,
      AppUpDownItem(
          onUp: () {
            setState(() => hour++);
          },
          onDown: () {
            setState(() => hour--);
          },
          value: '$hour'),
      Text(':', style: getMediumStyle(fontSize: FontSizeManager.s22, color: ColorManager.gray)),
      AppUpDownItem(
          onUp: () {
            setState(() => min++);
          },
          onDown: () {
            setState(() => min--);
          },
          value: '$min'),
      0.0.width,
    ]);
  }
}

class AppDatePicker extends StatefulWidget {
  const AppDatePicker({super.key});

  @override
  State<AppDatePicker> createState() => _AppDatePickerState();
}

class _AppDatePickerState extends State<AppDatePicker> {
  int day = 12;
  int month = 2;
  List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  int year = 2023;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      AppUpDownItem(
          onUp: () {
            setState(() => day++);
          },
          onDown: () {
            setState(() => day--);
          },
          value: '$day'),
      Text('/', style: getMediumStyle(fontSize: FontSizeManager.s22, color: ColorManager.gray)),
      AppUpDownItem(
          onUp: () {
            setState(() => month++);
          },
          onDown: () {
            setState(() => month--);
          },
          value: months[month]),
      Text('/', style: getMediumStyle(fontSize: FontSizeManager.s22, color: ColorManager.gray)),
      AppUpDownItem(
          onUp: () {
            setState(() => year++);
          },
          onDown: () {
            setState(() => year--);
          },
          value: '$year'),
    ]);
  }
}

class AppUpDownItem extends StatefulWidget {
  final VoidCallback onUp;
  final VoidCallback onDown;
  final String value;
  const AppUpDownItem({super.key, required this.onUp, required this.onDown, required this.value});

  @override
  State<AppUpDownItem> createState() => _AppUpDownItemState();
}

class _AppUpDownItemState extends State<AppUpDownItem> {
  SlideTransitionAnimatation slideTransitionAnimatation = SlideTransitionAnimatation.UP;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      IconButton(
          onPressed: () {
            slideTransitionAnimatation = SlideTransitionAnimatation.UP;
            widget.onUp();
          },
          icon: Icon(Icons.keyboard_arrow_up_rounded, color: ColorManager.gray, size: FontSizeManager.s22)),
      AnimatedSwitcher(
          duration: DurationValueManager.d200,
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          transitionBuilder: (child, animation) => _fadeAndSlideTransitionBuilder(child, animation, slideTransitionAnimatation),
          child: Text(widget.value,
              key: Key(widget.value), style: getBoldStyle(fontSize: FontSizeManager.s22, color: ColorManager.onSurface))),
      IconButton(
          onPressed: () {
            slideTransitionAnimatation = SlideTransitionAnimatation.DOWN;
            widget.onDown();
          },
          icon: Icon(Icons.keyboard_arrow_down_rounded, color: ColorManager.gray, size: FontSizeManager.s22))
    ]);
  }

  Widget _fadeAndSlideTransitionBuilder(Widget child, Animation<double> animation, SlideTransitionAnimatation slideTransitionAnimatation) {
    return FadeTransition(
        opacity: animation,
        child: SlideTransition(
            position: animation.drive(Tween<Offset>(
                begin: Offset(0, slideTransitionAnimatation == SlideTransitionAnimatation.UP ? 0.5 : -0.5), end: const Offset(0, 0))),
            child: Align(alignment: Alignment.topCenter, child: child)));
  }
}
