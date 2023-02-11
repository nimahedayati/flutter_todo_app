import 'package:flutter/material.dart';
import 'package:flutter_todo_app/app/extensions.dart';

class GradientManager {
  static LinearGradient primary = LinearGradient(colors: [ColorManager.primaryLight, ColorManager.primaryDark]);
  static LinearGradient checkbox =
      const LinearGradient(colors: [Color(0xff55DDFF), Color(0xffC058F3)], begin: Alignment(-2.0, -2), end: Alignment(2.0, 2));
}

class ColorManager {
  static Color primary = "#3A7CFD".toColor();
  static Color primaryLight = "#5596FF".toColor();
  static Color primaryDark = "#AC2DEB".toColor();
  static Color onPrimary = "#FFFFFF".toColor();
  static Color error = "#e61f34".toColor();
  static Color onError = "#FFFFFF".toColor();
  static Color background = "#FAFAFA".toColor();
  static Color onBackground = "#494C6B".toColor();
  static Color surface = "#FFFFFF".toColor();
  static Color onSurface = "#494C6B".toColor();

  static Color white = "#FFFFFF".toColor();
  static Color black = "#000000".toColor();
  static Color gray = "#E3E4F1".toColor();
  static Color darkGray = "#9495A5".toColor();
  static Color lightGray = "#D1D2DA".toColor();
}
