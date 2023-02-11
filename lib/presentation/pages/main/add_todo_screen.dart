import 'package:flutter/material.dart';
import 'package:flutter_todo_app/app/extensions.dart';
import 'package:flutter_todo_app/presentation/resources/color_manager.dart';
import 'package:flutter_todo_app/presentation/resources/font_manager.dart';
import 'package:flutter_todo_app/presentation/resources/strings_manager.dart';
import 'package:flutter_todo_app/presentation/resources/styles_manager.dart';
import 'package:flutter_todo_app/presentation/resources/values_manager.dart';
import 'package:flutter_todo_app/presentation/widgets/app_card_view.dart';
import 'package:flutter_todo_app/presentation/widgets/app_datetime_picker.dart';

class AddTodoScreen extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback onAdd;
  const AddTodoScreen({super.key, required this.onAdd, required this.onBack});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        Expanded(
          child: _buildDateTimeClickableItem('11 Februry', 'Time', () {
            FocusScope.of(context).unfocus();

            showDialog(
                context: context,
                builder: (context) => Dialog(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    child: AppCardView(
                      padding: const EdgeInsets.all(SizeValueManager.s20),
                      child: AppDatePicker(),
                    )));
          }),
        ),
        SizeValueManager.s18.width,
        Expanded(
          child: _buildDateTimeClickableItem('21:10', 'Date', () {
            FocusScope.of(context).unfocus();

            showDialog(
                context: context,
                builder: (context) => Dialog(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    child: AppCardView(
                      padding: const EdgeInsets.all(SizeValueManager.s20),
                      child: AppTimePicker(),
                    )));
          }),
        ),
      ]),
      SizeValueManager.s18.height,
      AppCardView(
          padding: const EdgeInsets.all(SizeValueManager.s20),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            GestureDetector(
                onTap: widget.onBack,
                child:
                    Text(StringsManager.backWithIcon, style: getMediumStyle(color: ColorManager.darkGray, fontSize: FontSizeManager.s14))),
            GestureDetector(
                onTap: widget.onAdd,
                child: Text(StringsManager.addWithIcon, style: getMediumStyle(color: ColorManager.primary, fontSize: FontSizeManager.s14))),
          ])),
      SizeValueManager.s18.height,
    ]);
  }

  _buildDateTimeClickableItem(String title, String subtitle, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: AppCardView(
          padding: const EdgeInsets.all(24.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text(title, style: getSemiBoldStyle(fontSize: FontSizeManager.s18, color: ColorManager.onSurface)),
            SizeValueManager.s16.height,
            Text(subtitle, style: getLightStyle(fontSize: FontSizeManager.s16, color: ColorManager.darkGray)),
          ])),
    );
  }
}
