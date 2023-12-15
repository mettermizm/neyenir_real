import 'dart:async';

import 'package:flutter/material.dart';

/// The Debouncer class takes a callback function and a delay in milliseconds. It will call the callback
/// function after the delay, but if the Debouncer is called again before the delay is up, it will reset
/// the delay and call the callback function again after the delay.
class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
