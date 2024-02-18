import 'package:flutter/material.dart';
import 'package:minimal_calculator/screens/home.dart';

import 'constants/style.dart';

void main() {
  runApp(const Main());
}

bool isDark = true;
ThemeData activeTheme = darkTheme;

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: activeTheme,
      // darkTheme: darkTheme,
      home: Home(toggleTheme: toggleTheme),
    );
  }

  // callback function
  void toggleTheme() {
    setState(() {
      isDark = !isDark;
      activeTheme = isDark ? darkTheme : lightTheme;
    });
  }
}
