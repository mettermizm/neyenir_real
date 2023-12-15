import 'package:flutter/material.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';

class CustomShadow extends BoxShadow {
  CustomShadow({Key? key, Offset? offset})
      : super(
          blurRadius: 10,
          spreadRadius: 1,
          color: AppColor.primary.shade50,
          offset: offset ?? const Offset(0, 10),
        );
}
