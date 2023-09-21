import 'package:flutter/material.dart';

class AppColor {
  static const Color primary = Color(0xFF128c7e);
  static const Color secondary = Color.fromARGB(255, 185, 243, 187);

  static MaterialColor primaryColor =
      const MaterialColor(0xFF128c7e, <int, Color>{
    50: Color(0xFFffffff),
    100: Color(0xFFe7f4f2),
    200: Color(0xFFd0e8e5),
    300: Color(0xFFa0d1cb),
    400: Color(0xFF89c6bf),
    500: Color(0xFF71bab2),
    600: Color(0xFF59afa5),
    700: Color(0xFF41a398),
    800: Color(0xFF2a988b),
    900: Color(0xFF128c7e),
  });
}
