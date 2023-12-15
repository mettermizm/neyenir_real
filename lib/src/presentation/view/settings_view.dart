import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/main.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';
import 'package:neyenir_app/src/config/router/app_router.dart';
import 'package:neyenir_app/src/core/components/circle_avatar/default_circle_avatar.dart';
import 'package:neyenir_app/src/core/components/fields/location_text_form_field.dart';
import 'package:neyenir_app/src/core/components/padding/page_padding.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';
import 'package:neyenir_app/src/core/components/texts/neyenir_banner.dart';
import 'package:neyenir_app/src/core/components/texts/notification_badge.dart';
import 'package:neyenir_app/src/core/enums/image_source.dart';
import 'package:neyenir_app/src/core/enums/profile_enums.dart';
import 'package:neyenir_app/src/core/extensions/number_format_extension.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => router.push(ProfileRouter(profileEnums: ProfileEnums.me)),
            child: Container(
              height: .1.sh,
              padding: CustomPadding.symmetric(),
              child: Row(
                children: [
                  const DefaultCircleAvatar(
                    'assets/images/user.jpg',
                    source: ImageSource.asset,
                  ),
                  SizedBox(width: .035.sw),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTextSemiBold('Neslihan Bayraktar'),
                      SizedBox(height: .035.sw),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              CustomTextSemiBold(235.toCompact),
                              CustomTextMedium('Takipçi', fontSize: 8.sp),
                            ],
                          ),
                          SizedBox(width: .05.sw),
                          Column(
                            children: [
                              CustomTextBold(937.toCompact),
                              CustomTextMedium('Takip', fontSize: 8.sp),
                            ],
                          ),
                          SizedBox(width: .05.sw),
                          Column(
                            children: [
                              CustomTextBold(96.toCompact),
                              CustomTextMedium('Yorum', fontSize: 8.sp),
                            ],
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const PagePadding(child: NeyenirBanner()),
          const PagePadding(child: LocationTextFormField(withButton: true)),
          const Divider(),
          Row(
            children: const [
              PagePadding(child: CustomTextSemiBold('BİLDİRİMLER')),
              NotificationBadge(1),
            ],
          ),
          const Divider(),
          ListTile(
            onTap: () => router.push(const PersonalInformationRouter()),
            contentPadding: EdgeInsets.symmetric(horizontal: 0.075.sw),
            title: const CustomTextLight('KİŞİSEL BİLGİLERİM'),
          ),
          const Divider(),
          const PagePadding(child: CustomTextLight('İLETİŞİM')),
          const Divider(),
          PagePadding(
            child: CustomTextLight(
              'ÇIKIŞ',
              color: AppColor.primary.shade200,
            ),
          ),
        ],
      ),
    );
  }
}
