library app_themes;

///Keeps in itself theme information.
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Color appColor = Color(0xFF40BBC2);
Color? backgroundColor = Colors.grey[100];

///Theme for elevated buttons
final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith(
      (_) => appColor,
    ),
    textStyle: MaterialStateProperty.resolveWith(
      (_) => TextStyle(color: Colors.white),
    ),
    shape: MaterialStateProperty.resolveWith(
      (_) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    ),
  ),
);

///Info about white application theme.
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
