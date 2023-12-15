import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/main.dart';
import 'package:neyenir_app/src/config/icon/app_icon.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';
import 'package:neyenir_app/src/config/router/app_router.dart';
import 'package:neyenir_app/src/core/components/row/horizontal_layout_list.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';
import 'package:neyenir_app/src/core/enums/profile_enums.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({
    Key? key,
    required this.profileEnums,
    this.pageController,
  }) : super(key: key);

  final ProfileEnums profileEnums;
  final PageController? pageController;

  @override
  Widget build(BuildContext context) {
    if (profileEnums == ProfileEnums.store) return StoreInfoWidget(pageController: pageController);
    return const PeopleInfoWidget();
  }
}

class PeopleInfoWidget extends StatelessWidget {
  const PeopleInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => router.push(const BadgesRouter()),
      child: const HorizontalLayoutList(
        children: <Widget>[
          Icon(Icons.line_axis),
          Icon(Icons.disc_full),
          Icon(Icons.keyboard_arrow_up),
          Icon(Icons.bubble_chart),
          Icon(Icons.stacked_bar_chart),
        ],
      ),
    );
  }
}

class StoreInfoWidget extends StatelessWidget {
  const StoreInfoWidget({Key? key, this.pageController}) : super(key: key);

  final PageController? pageController;

  @override
  Widget build(BuildContext context) {
    return HorizontalLayoutList(
      children: <Widget>[
        InkWell(
          onTap: () {
            if (pageController?.page == 0) {
              pageController!.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            } else {
              pageController?.previousPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            }
          },
          child: Row(
            children: [
              CustomTextMedium(
                'Ekip',
                fontSize: 11.sp,
                color: (pageController!.page ?? 0.0) > 0.5 ? AppColor.secondary : AppColor.primary,
              ),
              const SizedBox(width: 7),
              Icon(AppIcon.team, size: 18.sp),
            ],
          ),
        ),
        InkWell(
          onTap: () => router.push(const ShareRateRouter()),
          child: Row(
            children: [
              Icon(AppIcon.share, size: 18.sp),
              const SizedBox(width: 7),
              CustomTextMedium('Paylaş', fontSize: 11.sp),
            ],
          ),
        ),
        InkWell(
          onTap: () => router.push(const MapRouter()),
          child: Row(
            children: [
              Icon(AppIcon.direction, size: 18.sp),
              const SizedBox(width: 7),
              CustomTextMedium('Yol Tarifi Al', fontSize: 11.sp),
            ],
          ),
        )
      ],
    );
  }
}
