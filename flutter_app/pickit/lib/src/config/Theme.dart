import 'package:flutter/material.dart';

class PickIt {
  static const primaryColor = Color(0xFF0085AF);
  static const secondaryColor = Color(0xFF74D1E6);

  ThemeData get principalTheme {
    return ThemeData(
      primaryColor: primaryColor,
      accentColor: secondaryColor,
      cursorColor: secondaryColor,
    );
  }
}
