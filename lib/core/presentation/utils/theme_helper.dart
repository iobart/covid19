
import 'package:flutter/material.dart';

class ThemeHelp  {
  var lightThemeData = ThemeData(
      primaryColor: Colors.orange,
      canvasColor: Colors.orange,
      cardColor: Colors.white,
      textTheme: const TextTheme(labelLarge: TextStyle(color: Colors.black)),
      brightness: Brightness.light,
      hintColor: Colors.black);

  var darkThemeData = ThemeData(
      primaryColor: Colors.blue,
      cardColor: Colors.black,
      canvasColor: Colors.deepPurple,
      textTheme:  const TextTheme(labelLarge: TextStyle(color: Colors.black54)),
      brightness: Brightness.dark,
      hintColor: Colors.white);
}