import 'package:flutter/material.dart';

TextStyle outputTextStyle = const TextStyle(
  fontSize: 48,
  fontWeight: FontWeight.bold,
);

TextStyle inputTextStyle = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: Colors.grey[800]!,
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.black87,
    primary: Colors.grey[300]!,
  ),
);
