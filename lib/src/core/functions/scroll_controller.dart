import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neyenir_app/src/presentation/bloc/application/application_bloc.dart';

class ScrollListener {
  /// > It listens to the scroll controller and if the offset is greater than 250,
  /// it will show the top button
  ///
  /// Args:
  ///   context (BuildContext): The context of the widget that is calling the function.
  ///   controller (ScrollController): The scroll controller of the scrollable widget.
  static void toTop({required BuildContext context, required ScrollController controller}) {
    controller.addListener(() {
      if (controller.offset >= 250) {
        context.read<ApplicationBloc>().add(const OnVisiblityChange(true));
      } else {
        context.read<ApplicationBloc>().add(const OnVisiblityChange(false));
      }
    });
  }
}
