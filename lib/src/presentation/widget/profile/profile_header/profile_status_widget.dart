import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/main.dart';
import 'package:neyenir_app/src/config/router/app_router.dart';
import 'package:neyenir_app/src/core/components/button/follow_button.dart';
import 'package:neyenir_app/src/core/components/button/primary_button.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';
import 'package:neyenir_app/src/core/enums/profile_enums.dart';
import 'package:neyenir_app/src/core/extensions/number_format_extension.dart';

class ProfileStatusWidget extends StatelessWidget {
  const ProfileStatusWidget({Key? key, required this.profileEnums}) : super(key: key);
  final ProfileEnums profileEnums;

  @override
  Widget build(BuildContext context) {
    if (profileEnums == ProfileEnums.store) return const StoreStatusWidget();
    return PeopleStatusWidget(profileEnums: profileEnums);
  }
}

class PeopleStatusWidget extends StatelessWidget {
  const PeopleStatusWidget({Key? key, required this.profileEnums}) : super(key: key);
  final ProfileEnums profileEnums;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ProfileStatusItemList(
            onTap: () => router.push(const FollowRouter()),
            value: 1532.toCompact,
            title: 'Takipçi',
          ),
          ProfileStatusItemList(
            onTap: () => router.push(const FollowRouter()),
            value: 90538.toCompact,
            title: 'Takip',
          ),
          ProfileStatusItemList(title: 'Yorum', value: 432.toCompact),
          SizedBox(width: 1.w),
          if (profileEnums == ProfileEnums.me) ...[
            PrimaryButton(onPressed: () {}, title: 'Profilimi Düzenle'),
          ] else ...[
            const FollowButton(status: true, outline: false),
          ]
        ],
      ),
    );
  }
}

class StoreStatusWidget extends StatelessWidget {
  const StoreStatusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ProfileStatusItemList(
            title: 'Ziyaretçi',
            value: 1532.toCompact,
          ),
          ProfileStatusItemList(
            title: 'Yorum',
            value: 54322.toCompact,
          ),
          ProfileStatusItemList(
            title: 'Fotoğraf',
            value: 39952.toCompact,
          ),
          SizedBox(width: 1.w),
          const FollowButton(status: false, outline: true)
        ],
      ),
    );
  }
}

class ProfileStatusItemList extends StatelessWidget {
  const ProfileStatusItemList({
    Key? key,
    required this.title,
    required this.value,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String value;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CustomTextBold(value, fontSize: 14.sp),
                CustomTextMedium(
                  title,
                  fontSize: 8.sp,
                  textHeight: 1.1,
                  textAlign: TextAlign.center,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
