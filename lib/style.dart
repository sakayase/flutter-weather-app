import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

ThemeData theme = FlexThemeData.light(
  colors: const FlexSchemeColor(
    primary: Colors.yellow,
    secondary: Colors.red,
  ),
).copyWith(
  useMaterial3: true,
);
