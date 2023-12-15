import 'package:flutter/material.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';
import 'package:neyenir_app/src/presentation/widget/application/no_network_widget.dart';

/// It's a widget that wraps the entire app in a Material widget with a primary color and a column with
/// an expanded child and a NoNetworkWidget
class MainBuild {
  MainBuild._();
  static Widget build(BuildContext context, Widget? child) {
    return MediaQuery(
      // Setting font does not change with system font size
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Material(
        color: AppColor.primary,
        elevation: 0,
        child: Column(
          children: [
            Expanded(child: child ?? Container(color: AppColor.primary)),
            const NoNetworkWidget(),
          ],
        ),
      ),
    );
  }
}
