import 'package:flutter/material.dart';

class UiHelpers {
  static EdgeInsets paddingVertical({double hspacing = 0}) =>
      EdgeInsets.symmetric(horizontal: hspacing, vertical: 6);

  static const EdgeInsets evenSpaceAroundMedium = EdgeInsets.all(8);

  static const EdgeInsets evenSpaceAroundMediumLarge = EdgeInsets.all(10);
}
