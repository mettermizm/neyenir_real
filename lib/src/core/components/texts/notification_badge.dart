import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';

class NotificationBadge extends StatelessWidget {
  const NotificationBadge(
    this.badgeCount, {
    Key? key,
  }) : super(key: key);

  final int badgeCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(7.5.sp),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
      child: CustomTextBold('$badgeCount', color: Colors.white),
    );
  }
}
