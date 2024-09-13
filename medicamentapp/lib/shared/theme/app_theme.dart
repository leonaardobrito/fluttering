import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      // TODO: passar pra const file
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: const Color.fromARGB(223, 33, 59, 105),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
      ),
    );
  }
}
