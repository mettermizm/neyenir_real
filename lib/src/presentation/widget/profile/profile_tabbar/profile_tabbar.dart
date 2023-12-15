import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/main.dart';
import 'package:neyenir_app/src/config/router/app_router.dart';
import 'package:neyenir_app/src/core/components/button/primary_button.dart';
import 'package:neyenir_app/src/core/components/tabbar/custom_tabbar.dart';
import 'package:neyenir_app/src/core/enums/profile_enums.dart';

class ProfileTabbar extends StatelessWidget {
  const ProfileTabbar({
    Key? key,
    required this.tabController,
    required this.profileEnums,
  }) : super(key: key);

  final TabController tabController;
  final ProfileEnums profileEnums;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: .025.sw),
      child: Row(
        children: [
          Flexible(
            child: CustomTabbar(
              tab: profileEnums == ProfileEnums.user || profileEnums == ProfileEnums.me
                  ? const ['Lezzetler', 'Mekanlar']
                  : const ['Menü', 'Yorumlar', 'Fotoğraflar'],
              tabController: tabController,
              border: false,
            ),
          ),
          if (profileEnums == ProfileEnums.me) ...[
            Padding(
              padding: EdgeInsets.only(right: .05.sw),
              child: PrimaryButton(
                title: "Filtrele",
                icon: Icons.filter_list,
                outline: true,
                onPressed: () => router.push(const FilterRouter()),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
