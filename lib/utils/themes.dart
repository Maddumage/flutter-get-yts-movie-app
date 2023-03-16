import 'package:flutter/material.dart';

ThemeData customDarkTheme() {
  final ThemeData darkTheme = ThemeData.dark();
  return ThemeData(
    primaryColor: const Color(0xFF212121),
    primaryColorDark: const Color(0xFF121212),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFF212121), primary: const Color(0xFF121212)),
    indicatorColor: const Color(0xFFB32855),
    primaryIconTheme: darkTheme.primaryIconTheme.copyWith(
      color: Colors.green,
      size: 20,
    ),
    buttonTheme: ButtonThemeData(colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFFFFF8E1))),
    fontFamily: 'Lato'
  );
}
