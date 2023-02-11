import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, String fontFamily, FontWeight fontWeight, Color? color) {
  return TextStyle(fontSize: fontSize, fontFamily: fontFamily, color: color, fontWeight: fontWeight);
}

// regular style
TextStyle getRegularStyle({double fontSize = FontSizeManager.s12, Color? color}) {
  return _getTextStyle(fontSize, FontFamilyManaget.main, FontWeightManager.regular, color);
}

// light text style
TextStyle getLightStyle({double fontSize = FontSizeManager.s12, Color? color}) {
  return _getTextStyle(fontSize, FontFamilyManaget.main, FontWeightManager.light, color);
}

// bold text style
TextStyle getBoldStyle({double fontSize = FontSizeManager.s12, Color? color}) {
  return _getTextStyle(fontSize, FontFamilyManaget.main, FontWeightManager.bold, color);
}

// semi bold text style
TextStyle getSemiBoldStyle({double fontSize = FontSizeManager.s12, Color? color}) {
  return _getTextStyle(fontSize, FontFamilyManaget.main, FontWeightManager.semiBold, color);
}

// medium text style
TextStyle getMediumStyle({double fontSize = FontSizeManager.s12, Color? color}) {
  return _getTextStyle(fontSize, FontFamilyManaget.main, FontWeightManager.medium, color);
}
