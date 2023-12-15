import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/core/components/shadow/custom_shadow.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({
    Key? key,
    required this.details,
    required this.width,
  }) : super(key: key);

  final Widget details;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Container(
        height: 90.h,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
          boxShadow: <BoxShadow>[CustomShadow(offset: const Offset(0, 1))],
        ),
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: details,
        ),
      ),
    );
  }
}
