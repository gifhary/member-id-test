import 'package:flutter/material.dart';

class AppButtonTheme {
  static ElevatedButtonThemeData primary = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(double.maxFinite, 50),
      textStyle: const TextStyle(fontSize: 20),
      backgroundColor: Colors.cyan,
      foregroundColor: Colors.white,
      shape: const StadiumBorder(),
    ),
  );

  static OutlinedButtonThemeData secondary = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      fixedSize: const Size(double.maxFinite, 50),
      textStyle: const TextStyle(fontSize: 20),
      foregroundColor: Colors.cyan,
      shape: const StadiumBorder(),
      side: const BorderSide(width: 2, color: Colors.cyan),
    ),
  );
}
