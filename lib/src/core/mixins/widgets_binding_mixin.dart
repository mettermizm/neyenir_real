import 'package:flutter/material.dart';

/// A mixin that allows you to run a function after the page has been rendered.
mixin StateMixin<T extends StatefulWidget> on State<T> {
  void afterPageRendered(VoidCallback function) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      function.call();
    });
  }
}
