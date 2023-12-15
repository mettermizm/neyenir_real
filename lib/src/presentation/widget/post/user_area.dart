import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/main.dart';
import 'package:neyenir_app/src/config/router/app_router.dart';
import 'package:neyenir_app/src/core/components/button/follow_button.dart';
import 'package:neyenir_app/src/core/components/circle_avatar/default_circle_avatar.dart';
import 'package:neyenir_app/src/core/components/container/banner_container.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';
import 'package:neyenir_app/src/core/enums/profile_enums.dart';

class UserArea extends StatelessWidget {
  const UserArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BannerContainer(
      child: InkWell(
        /// A function that is used to navigate to the user's profile page.
        onTap: () => router.push(ProfileRouter(profileEnums: ProfileEnums.user)),
        child: Row(
          children: const <Widget>[
            /// A widget that is used to display the user's avatar.
            UserAvatar(),

            /// A widget that displays the user's name and the time of the post.
            UserDetail(),

            /// A button that is used to follow the user.
            FollowButton(status: false),
            // FollowStatusButton(),
          ],
        ),
      ),
    );
  }
}

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediumAvatar(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPHRvtFUvNT9Rrpz2HE4gu05hPPg8m7DweCg&usqp=CAU',
    );
  }
}

class UserDetail extends StatelessWidget {
  const UserDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 0.0275.sw),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomTextMedium('Pelin Yalçın', fontSize: 12.sp),
            SizedBox(height: 2.sp),
            CustomTextMedium('10 saat önce', fontSize: 9.sp)
          ],
        ),
      ),
    );
  }
}
