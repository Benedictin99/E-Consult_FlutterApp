import 'package:flutter/material.dart';

const tDarkPrimaryColor = Color(0xFF000000);
const tDarkSecondaryColor = Color(0xFF373737);
const tLightPrimaryColor = Color(0xFFFFFFFF);
const tLightSecondaryColor = Color(0xFFB2B2B2);
const tAccentColor = Color(0xFFFFD200);

final tDarkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: tDarkPrimaryColor,
  canvasColor: tDarkPrimaryColor,
  hintColor: tDarkSecondaryColor,
  iconTheme: ThemeData.dark().iconTheme.copyWith(
    color: tLightSecondaryColor,
  ),
  textTheme: ThemeData.dark().textTheme.apply(
    bodyColor: tLightSecondaryColor,
    displayColor: tLightSecondaryColor,
  ),
);

final tLightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: tLightPrimaryColor,
  canvasColor: tLightPrimaryColor,
  hintColor: tLightSecondaryColor,
  iconTheme: ThemeData.dark().iconTheme.copyWith(
    color: tDarkSecondaryColor,
  ),
  textTheme: ThemeData.dark().textTheme.apply(
    bodyColor: tDarkSecondaryColor,
    displayColor: tDarkSecondaryColor,
  ),
);

