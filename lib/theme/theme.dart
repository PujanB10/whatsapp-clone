import 'package:flutter/material.dart';
import 'package:whatsapp/utils/styles/app_color.dart';
import 'package:whatsapp/utils/styles/app_font_sizes.dart';

final ThemeData whatsappTheme = ThemeData(
  primaryColor: AppColor.primary,
  appBarTheme: const AppBarTheme(color: AppColor.primary),
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: AppColor.primary),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: AppFontSizes.small),
    titleMedium: TextStyle(fontSize: AppFontSizes.smallLarge),
    bodyLarge: TextStyle(
        fontSize: AppFontSizes.smallLarge, fontWeight: FontWeight.normal),
    labelSmall: TextStyle(fontSize: AppFontSizes.smallMedium),
  ),
);
