/// It's a class that extends the AppTheme class and returns a ThemeData object with the light theme
import 'package:flutter/material.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';
import 'package:neyenir_app/src/core/constants/application_constants.dart';
import 'package:neyenir_app/src/core/theme/app_theme.dart';

class LightTheme extends AppTheme {
  @override
  ThemeData get theme => ThemeData(
        fontFamily: ApplicationConstants.fontFamily,
        primarySwatch: AppColor.light,
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: AppColor.dark),
        ),
        scaffoldBackgroundColor: AppColor.light,
        appBarTheme: const AppBarTheme(elevation: 0),
      );
}
