import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';

class ProfileStatus extends StatelessWidget {
  const ProfileStatus({
    Key? key,
    required this.status,
    required this.width,
  }) : super(key: key);

  final Widget status;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 110.h,
      child: Container(
        padding: EdgeInsets.only(top: 15.h),
        width: width,
        height: 70.h,
        decoration: BoxDecoration(
          color: AppColor.light.shade400,
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
          border: Border.all(color: Colors.white, width: 5.r),
        ),
        child: status,
      ),
    );
  }
}
