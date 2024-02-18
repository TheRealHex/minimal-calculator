import 'package:flutter/material.dart';

TextStyle outputTextStyle(BuildContext context) {
  return Theme.of(context).textTheme.headlineMedium!.copyWith(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary,
      );
}

TextStyle inputTextStyle(BuildContext context) {
  return Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary,
      );
}

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
