import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = appTheme;
  static final darkTheme = appDarkTheme;
  static const primaryColor = Colors.black87;
  static const backgroundAppColor = Color.fromRGBO(229, 152, 102, 1);
  static const backgroundAppColor2 = Color.fromRGBO(237, 187, 153, 1);
  static const backgroundAppColor3 = Color.fromRGBO(251, 238, 230, 1);

  static const titleTheme = TextStyle(
      fontSize: 25, fontFamily: 'Times New Roman', fontWeight: FontWeight.w700);
  static const subtitleTheme =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  static const greyLetter = TextStyle(fontSize: 14, color: Colors.black45);
}

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
