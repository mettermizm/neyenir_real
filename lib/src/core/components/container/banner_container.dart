// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';

class BannerContainer extends Container {
  BannerContainer({Key? key, required this.child})
      : super(
          key: key,
          margin: EdgeInsets.all(6.r),
          padding: EdgeInsets.symmetric(horizontal: .015.sw, vertical: .0125.sw),
          decoration: BoxDecoration(
            color: AppColor.light,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: child,
        );

  final Widget child;
}
