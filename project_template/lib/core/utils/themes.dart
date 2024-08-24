import 'package:flutter/material.dart';

const TextStyle defaultTextStyle = TextStyle(
  color: Colors.grey,
  fontSize: 16.0,
  fontWeight: FontWeight.normal,
);

const TextStyle defaultTitleStyle = TextStyle(
  color: Colors.black,
  fontSize: 28.0,
  fontWeight: FontWeight.normal,
);

// Definir el tema de la aplicación
final ThemeData appTheme = ThemeData(
  useMaterial3: false,
  primaryColor: Colors.white,
  hintColor: Colors.deepPurpleAccent,
  textTheme: const TextTheme(
    bodySmall: defaultTextStyle,
    titleMedium: defaultTitleStyle,
  ),
);

// Definir el tema oscuro de la aplicación
final ThemeData appDarkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.deepPurple,
  hintColor: Colors.deepPurpleAccent,
  textTheme: TextTheme(
    bodySmall: defaultTextStyle.copyWith(color: Colors.white),
    titleMedium: defaultTitleStyle.copyWith(color: Colors.white),

  ),
);

class AppThemes {
  static final lightTheme = appTheme;
  static final darkTheme = appDarkTheme;
}
