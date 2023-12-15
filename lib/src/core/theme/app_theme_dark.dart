/// It's a class that extends the AppTheme class and overrides the themeData() method
import 'package:flutter/material.dart';
import 'package:neyenir_app/src/core/constants/application_constants.dart';
import 'package:neyenir_app/src/core/theme/app_theme.dart';

class DarkTheme extends AppTheme {
  ThemeData themeData() {
    return ThemeData(
      fontFamily: ApplicationConstants.fontFamily,
      brightness: Brightness.dark,
    );
  }
}
