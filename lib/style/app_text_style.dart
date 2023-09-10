import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/style/app_font_sizes.dart';

class AppTextStyle {
  static TextStyle hintStyle(BuildContext context, Color color) {
    return GoogleFonts.alef(
        fontSize: AppFontSizes.medium, textStyle: TextStyle(color: color));
  }

  static TextStyle textMessageStyle(BuildContext context, Color color) {
    return GoogleFonts.alef(
        fontSize: AppFontSizes.smallMedium, textStyle: TextStyle(color: color));
  }
}
