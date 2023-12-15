import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';
import 'package:neyenir_app/src/config/icon/app_icon.dart';
import 'package:neyenir_app/src/core/components/button/base_button.dart';
import 'package:neyenir_app/src/core/components/container/banner_container.dart';

class SocialArea extends StatelessWidget {
  const SocialArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BannerContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          /// A widget that is used to show the share button.
          ShareButton(),

          /// A widget that is used to show the like button.
          LikeButton(),
        ],
      ),
    );
  }
}

class LikeButton extends StatelessWidget {
  const LikeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      title: 'Beğen',
      fontSize: 12.sp,
      textColor: AppColor.primary,
      primaryColor: AppColor.light,
      backgroundColor: AppColor.light,
      icon: AppIcon.heart_0,
      iconSize: 15.sp,
      onPressed: () {},
    );
  }
}

class ShareButton extends StatelessWidget {
  const ShareButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      title: 'Paylaş',
      fontSize: 12.sp,
      textColor: AppColor.primary,
      primaryColor: AppColor.light,
      backgroundColor: AppColor.light,
      icon: AppIcon.share,
      iconSize: 15.sp,
      onLeft: true,
      onPressed: () {},
    );
  }
}
