import 'package:flutter/material.dart';
import 'package:flutter_todo_app/presentation/resources/color_manager.dart';
import 'package:flutter_todo_app/presentation/resources/values_manager.dart';

typedef ValueChanged<T> = void Function(T value);

class AppRoundedCheckbox extends StatefulWidget {
  final bool checked;
  final ValueChanged<bool>? onChanged;

  const AppRoundedCheckbox({super.key, required this.checked, this.onChanged});

  @override
  State<AppRoundedCheckbox> createState() => _AppRoundedCheckboxState();
}

class _AppRoundedCheckboxState extends State<AppRoundedCheckbox> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _changeChecked,
        child: SizedBox(
            width: SizeValueManager.s48,
            height: SizeValueManager.s48,
            child: AnimatedSwitcher(duration: DurationValueManager.d200, child: check ? _activeCheckbox() : _unactiveCheckbox())));
  }

  @override
  void initState() {
    check = widget.checked;
    super.initState();
  }

  @override
  void didUpdateWidget(AppRoundedCheckbox oldRoundedCheckbox) {
    setState(() => check = widget.checked);
    super.didUpdateWidget(oldRoundedCheckbox);
  }

  _changeChecked() {
    setState(() => check = !check);
    if (widget.onChanged != null) widget.onChanged!(check);
  }

  _activeCheckbox() {
    return Container(
        key: const Key('active-checkbox'),
        width: SizeValueManager.s20,
        height: SizeValueManager.s20,
        decoration: BoxDecoration(shape: BoxShape.circle, gradient: GradientManager.checkbox),
        child: Icon(Icons.done_rounded, color: ColorManager.onPrimary, size: SizeValueManager.s14));
  }

  _unactiveCheckbox() {
    return Container(
        key: const Key('unuactive-checkbox'),
        width: SizeValueManager.s20,
        height: SizeValueManager.s20,
        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: ColorManager.gray, width: SizeValueManager.s1)));
  }
}
