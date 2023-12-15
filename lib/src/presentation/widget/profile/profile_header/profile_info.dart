import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/core/components/shadow/custom_shadow.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    Key? key,
    required this.info,
    required this.width,
  }) : super(key: key);

  final Widget info;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 70.h,
      child: Container(
        padding: EdgeInsets.only(top: 20.h),
        width: width,
        height: 60.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
          boxShadow: <BoxShadow>[CustomShadow(offset: const Offset(0, 1))],
        ),
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: info,
        ),
      ),
    );
  }
}
