import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

ThemeData theme = FlexThemeData.light(
  colors: const FlexSchemeColor(
    primary: Colors.blue,
    secondary: Colors.white,
  ),
).copyWith(
  useMaterial3: true,
  scaffoldBackgroundColor: const Color.fromARGB(255, 227, 243, 251),
  cardTheme: const CardTheme(),
  inputDecorationTheme: const InputDecorationTheme(
    fillColor: Color.fromARGB(255, 238, 249, 255),
    filled: true,
    border: InputBorder.none,
  ),
);
