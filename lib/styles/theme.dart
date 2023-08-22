import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData appTheme = ThemeData(
  primaryColor: ThemeColors.primaryColor,
  useMaterial3: true,
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: ThemeColors.accentColor),
  // Configure other theme properties like text styles, fonts, etc.
);
