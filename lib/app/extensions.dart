import 'package:flutter/material.dart';

extension HexColorExtension on String {
  Color toColor() {
    String hexColorString = replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}

extension SpaceExtension on double {
  Widget get width => SizedBox(width: this);

  Widget get height => SizedBox(height: this);
}

extension PaddingExtension on Widget {
  Widget paddingAll(double padding) {
    return Padding(padding: EdgeInsets.all(padding), child: this);
  }
}
