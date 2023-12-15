import 'package:flutter/material.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';

/// It's a circular progress indicator with a stroke width of 2.5 and a secondary color
class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(AppColor.secondary),
    );
  }
}
