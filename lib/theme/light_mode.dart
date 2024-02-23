import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade200,
    primary: Colors.grey.shade200,
    secondary: Colors.grey.shade300,
    inversePrimary: Colors.grey.shade900,
    inverseSurface: Colors.grey.shade400,
  ),
  textTheme: ThemeData.light().textTheme.apply(
        bodyColor: Colors.grey.shade800,
        displayColor: Colors.black,
      ),
);
