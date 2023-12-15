import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/core/components/shadow/custom_shadow.dart';
import 'package:neyenir_app/src/presentation/widget/profile/profile_header/profile_detail.dart';
import 'package:neyenir_app/src/presentation/widget/profile/profile_header/profile_info.dart';
import 'package:neyenir_app/src/presentation/widget/profile/profile_header/profile_status.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key? key,
    required this.details,
    required this.info,
    required this.status,
    this.shadow = true,
  }) : super(key: key);

  final Widget details;
  final Widget info;
  final Widget status;
  final bool shadow;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Container(
          width: 1.sw,
          height: 180.h,
          decoration: shadow ? BoxDecoration(boxShadow: <BoxShadow>[CustomShadow()]) : null,
          child: Stack(
            children: [
              ProfileStatus(status: status, width: constraint.maxWidth),
              ProfileInfo(info: info, width: constraint.maxWidth),
              ProfileDetail(details: details, width: constraint.maxWidth),
            ],
          ),
        );
      },
    );
  }
}
