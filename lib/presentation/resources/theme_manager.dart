import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_todo_app/presentation/resources/color_manager.dart';
import 'package:flutter_todo_app/presentation/resources/font_manager.dart';
import 'package:flutter_todo_app/presentation/resources/styles_manager.dart';

ThemeData getApplicationTheme() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  return ThemeData(
      fontFamily: FontFamilyManaget.main,
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: ColorManager.primary,
          onPrimary: ColorManager.onPrimary,
          secondary: ColorManager.primary,
          onSecondary: ColorManager.onPrimary,
          error: ColorManager.error,
          onError: ColorManager.onError,
          background: ColorManager.background,
          onBackground: ColorManager.onBackground,
          surface: ColorManager.surface,
          onSurface: ColorManager.onSurface),
      textTheme: TextTheme(
          displayLarge: getRegularStyle(fontSize: FontSizeManager.s57),
          displayMedium: getRegularStyle(fontSize: FontSizeManager.s45),
          displaySmall: getRegularStyle(fontSize: FontSizeManager.s36),
          headlineLarge: getRegularStyle(fontSize: FontSizeManager.s32),
          headlineMedium: getRegularStyle(fontSize: FontSizeManager.s28),
          headlineSmall: getRegularStyle(fontSize: FontSizeManager.s24),
          titleLarge: getRegularStyle(fontSize: FontSizeManager.s22),
          titleMedium: getMediumStyle(fontSize: FontSizeManager.s16),
          titleSmall: getMediumStyle(fontSize: FontSizeManager.s14),
          labelLarge: getMediumStyle(fontSize: FontSizeManager.s14),
          labelMedium: getMediumStyle(fontSize: FontSizeManager.s12),
          labelSmall: getMediumStyle(fontSize: FontSizeManager.s11),
          bodyLarge: getRegularStyle(fontSize: FontSizeManager.s16),
          bodyMedium: getRegularStyle(fontSize: FontSizeManager.s14),
          bodySmall: getRegularStyle(fontSize: FontSizeManager.s12)),
      dividerTheme: DividerThemeData(color: ColorManager.gray, thickness: 1, space: 1));
}
