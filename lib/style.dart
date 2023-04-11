import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

ThemeData theme = FlexThemeData.light(
    scheme: FlexScheme.bahamaBlue,
    scaffoldBackground: Colors.transparent,
    appBarBackground: Colors.transparent,
    appBarElevation: 1,
    subThemesData: const FlexSubThemesData(
      navigationBarOpacity: 0,
      navigationBarSelectedIconSchemeColor: SchemeColor.tertiary,
      navigationBarSelectedLabelSchemeColor: SchemeColor.tertiary,
      navigationBarUnselectedIconSchemeColor: SchemeColor.inversePrimary,
      navigationBarUnselectedLabelSchemeColor: SchemeColor.inversePrimary,
      navigationBarElevation: 2,
    )).copyWith(
  cardColor: Colors.transparent,
  primaryTextTheme: Typography.material2021().white,
  textTheme: Typography.material2021().white,
  inputDecorationTheme: const InputDecorationTheme(
    hintStyle: TextStyle(color: Colors.white),
    labelStyle: TextStyle(color: Colors.white),
    prefixIconColor: Colors.white,
    border: InputBorder.none,
  ),
);
