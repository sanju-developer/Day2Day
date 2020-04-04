import 'package:flutter/material.dart';
import 'assets/colors/colors.dart';

final ThemeData customThemeData = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.light,
  scaffoldBackgroundColor: LightThemeColors.myCustomLightGreyColor,
  primaryColor: LightThemeColors.myCustomDarkBlueColor,
  primaryColorLight: LightThemeColors.myCustomLightBlueColor,
  accentColor: LightThemeColors.myCustomGreenColor,

  // Define the default font family.
  fontFamily: 'MartelSans',

  // Define the default TextTheme. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: TextTheme(
    headline: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
        color: LightThemeColors.myCustomDarkBlueColor),
    title: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w400,
        color: LightThemeColors.myCustomDarkBlueColor),
    body1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w200),
  ),
);
