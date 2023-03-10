import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mtodolist/ui/resources/resources.dart';

ThemeData themeDefault = ThemeData(
  primaryColor: Palette.primary,
  colorScheme: ThemeData().colorScheme.copyWith(
    primary: Palette.primary,
    secondary: Palette.primary,
    background: Palette.background,
    onSecondary: Palette.primary,
    onPrimary: Palette.primary,
  ),
  textSelectionTheme: const TextSelectionThemeData(cursorColor: Palette.accent),
  textTheme: const TextTheme(
    bodyText1: TextStyle(),
    bodyText2: TextStyle(),
  ).apply(
    bodyColor: Palette.text,
    displayColor: Palette.text,
  ),
  scaffoldBackgroundColor: Palette.white,
  iconTheme: const IconThemeData(color: Colors.black),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Palette.white,
  ),
  appBarTheme: const AppBarTheme(
    elevation: 10,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
    iconTheme: IconThemeData(color: Palette.white),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

// TextStyles class
class TextStyles {
  TextStyles._();

  static TextStyle h1 = TextStyle(
    fontSize: Dimens.h1,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    letterSpacing: -1.5,
    color: Palette.text,
  );

  static TextStyle h2 = TextStyle(
    fontSize: Dimens.h2,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    letterSpacing: 0.5,
    color: Palette.text,
  );

  static TextStyle h3 = TextStyle(
    fontSize: Dimens.h3,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    letterSpacing: 0,
    color: Palette.text,
  );

  static TextStyle h4 = TextStyle(
    fontSize: Dimens.h4,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    letterSpacing: 0.25,
    color: Palette.text,
  );

  static TextStyle h5 = TextStyle(
    fontSize: Dimens.h5,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    letterSpacing: 0,
    color: Palette.text,
  );

  static TextStyle h6 = TextStyle(
    fontSize: Dimens.h6,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    letterSpacing: 0.15,
    color: Palette.text,
  );

  static TextStyle body1 = TextStyle(
    fontSize: Dimens.body1,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    letterSpacing: 0.5,
    color: Palette.text,
  );

  static TextStyle body2 = TextStyle(
    fontSize: Dimens.body2,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
    letterSpacing: 0.25,
    color: Palette.text,
  );
}