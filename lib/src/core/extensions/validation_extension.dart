import 'package:neyenir_app/src/core/constants/regexp_constants.dart';

/// Extending the String class with a new getter.
extension ValidationExtension on String {
  String? get isValidName => length != 6 ? 'Hatalı Kod' : null;

  String? get validateEmail =>
      RegExp(RegExpContants.mailRegExp).hasMatch(this) ? null : 'Hatalı mail formatı';
}
