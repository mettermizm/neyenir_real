import 'package:flutter/material.dart';

/// LanguageManager is a class that has two properties, enLocale and trLocale, and a method,
/// supportedLocales, that returns a list of those two properties.
class LanguageManager {
  final enLocale = const Locale('en', 'US');
  final trLocale = const Locale('tr', 'TR');

  List<Locale> get supportedLocales => [enLocale, trLocale];
}
