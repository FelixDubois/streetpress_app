import 'package:flutter/material.dart';

const primaryColor = Color(0xFFb71c1c);
const primaryColorLight = Color(0xFFf05545);
const primaryColorDark = Color(0xFF7f0000);

const secondaryColor = Color(0xFFb2dfdb);
const secondaryColorLight = Color(0xFFe5ffff);
const secondaryColorDark = Color(0xFF82ada9);

const background = Color(0xFFfffdf7);
const textColor = Color(0xFFffffff);

class StreetPressTheme {
  static final ThemeData defaultTheme = _buildStreetPressTheme();

  static ThemeData _buildStreetPressTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      accentColor: secondaryColor,
      accentColorBrightness: Brightness.dark,
      primaryColor: primaryColor,
      primaryColorDark: primaryColorDark,
      primaryColorLight: primaryColorLight,
      primaryColorBrightness: Brightness.dark,
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: secondaryColor,
        textTheme: ButtonTextTheme.primary,
      ),
      scaffoldBackgroundColor: background,
      cardColor: background,
      backgroundColor: background,
    );
  }
}
