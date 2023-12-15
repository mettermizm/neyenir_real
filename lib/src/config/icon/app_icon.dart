// Place fonts/icomoon.ttf in your fonts/ directory and
// add the following to your pubspec.yaml
// flutter:
//   fonts:
//    - family: icomoon
//      fonts:
//       - asset: fonts/icomoon.ttf
// ignore_for_file: constant_identifier_names

import 'package:flutter/widgets.dart';

class AppIcon {
  AppIcon._();

  static const String _fontFamily = 'icomoon';

  static const IconData map_marker = IconData(0xe904, fontFamily: _fontFamily);
  static const IconData team = IconData(0xe905, fontFamily: _fontFamily);
  static const IconData direction = IconData(0xe906, fontFamily: _fontFamily);
  static const IconData sign_out = IconData(0xe907, fontFamily: _fontFamily);
  static const IconData ellipsis_h = IconData(0xe908, fontFamily: _fontFamily);
  static const IconData check = IconData(0xe909, fontFamily: _fontFamily);
  static const IconData arrow_left = IconData(0xe90a, fontFamily: _fontFamily);
  static const IconData arrow_up = IconData(0xe90b, fontFamily: _fontFamily);
  static const IconData bars = IconData(0xe90c, fontFamily: _fontFamily);
  static const IconData heart_0 = IconData(0xe902, fontFamily: _fontFamily);
  static const IconData share = IconData(0xe903, fontFamily: _fontFamily);
  static const IconData filter = IconData(0xe900, fontFamily: _fontFamily);
  static const IconData plus = IconData(0xe901, fontFamily: _fontFamily);
}
