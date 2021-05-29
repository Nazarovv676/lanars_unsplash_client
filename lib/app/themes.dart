/// Keeps in itself theme information.
library app_themes;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Color appColor = Color(0xFF40BBC2);
Color? backgroundColor = Colors.grey[100];
double buttonRadius = 30.0;

/// Theme for elevated buttons
final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith(
      (_) => appColor,
    ),
    textStyle: MaterialStateProperty.resolveWith(
      (_) => TextStyle(color: Colors.white),
    ),
    shape: MaterialStateProperty.resolveWith(
      (_) {
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonRadius),
        );
      },
    ),
  ),
);

/// Info about white application theme.
ThemeData light = ThemeData.light().copyWith(
  colorScheme: ColorScheme.light().copyWith(
    primary: appColor,
    primaryVariant: appColor,
    secondary: appColor,
    secondaryVariant: appColor,
    surface: backgroundColor,
    onSecondary: Colors.white,
    background: backgroundColor,
  ),
  accentIconTheme: IconThemeData.fallback(),
  backgroundColor: backgroundColor,
  accentColor: appColor,
  buttonColor: appColor,
  primaryColor: appColor,
  iconTheme: IconThemeData(
    color: Colors.black,
  ),
  elevatedButtonTheme: elevatedButtonTheme,
  buttonTheme: ButtonThemeData(buttonColor: appColor),
);
