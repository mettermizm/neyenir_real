import 'package:intl/intl.dart';

/// Extending the int class with a new method called toCompact.
extension NumberFormatCompact on int {
  String get toCompact => NumberFormat.compact().format(this);
}
