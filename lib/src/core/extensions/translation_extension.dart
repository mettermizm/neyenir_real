import 'package:easy_localization/easy_localization.dart';

/// An extension method that is used to translate the string.
extension TranslationExtension on String {
  String get translate => this.tr();
}
