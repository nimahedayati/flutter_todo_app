import 'package:flutter/material.dart';
import 'package:flutter_todo_app/presentation/resources/color_manager.dart';
import 'package:flutter_todo_app/presentation/resources/values_manager.dart';

class AppCardView extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const AppCardView({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: padding,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            color: ColorManager.surface,
            borderRadius: BorderRadius.circular(SizeValueManager.s5),
            boxShadow: const [BoxShadow(color: Color(0x80C2C3D6), blurRadius: 50, offset: Offset(0, 35), spreadRadius: -15)]),
        child: child);
  }
}
