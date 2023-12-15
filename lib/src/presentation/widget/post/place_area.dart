import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/main.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';
import 'package:neyenir_app/src/config/icon/app_icon.dart';
import 'package:neyenir_app/src/config/router/app_router.dart';
import 'package:neyenir_app/src/core/components/circle_avatar/default_circle_avatar.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';
import 'package:neyenir_app/src/core/enums/profile_enums.dart';

class PlaceArea extends StatelessWidget {
  const PlaceArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => router.push(ProfileRouter(profileEnums: ProfileEnums.store)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          /// A widget that is used to show the avatar of the place.
          PlaceAvatar(),

          /// A widget that is used to show the details of the place.
          PlaceDetails(),

          /// A widget that is used to show the more button.
          MoreButton(),
        ],
      ),
    );
  }
}

class PlaceAvatar extends StatelessWidget {
  const PlaceAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediumAvatar(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPHRvtFUvNT9Rrpz2HE4gu05hPPg8m7DweCg&usqp=CAU');
  }
}

class PlaceDetails extends StatelessWidget {
  const PlaceDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 0.0275.sw),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomTextSemiBold('NUSRET', fontSize: 12.sp),
            SizedBox(height: 2.sp),
            CustomTextMedium('Kadıköy / Suadiye', fontSize: 9.sp)
          ],
        ),
      ),
    );
  }
}

class MoreButton extends StatelessWidget {
  const MoreButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(AppIcon.ellipsis_h, color: AppColor.primary),
      onPressed: () {},
    );
  }
}
