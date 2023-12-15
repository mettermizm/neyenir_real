import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';
import 'package:neyenir_app/src/core/components/button/follow_button.dart';
import 'package:neyenir_app/src/core/components/cards/custom_card.dart';
import 'package:neyenir_app/src/core/components/circle_avatar/default_circle_avatar.dart';
import 'package:neyenir_app/src/core/components/tabbar/custom_tabbar.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';
import 'package:neyenir_app/src/core/extensions/number_format_extension.dart';

class FollowView extends StatefulWidget {
  const FollowView({Key? key}) : super(key: key);

  @override
  State<FollowView> createState() => _FollowViewState();
}

class _FollowViewState extends State<FollowView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('@neslihan_bayraktar'),
        bottom: PreferredSize(
          preferredSize: Size(1.sw, .125.sw),
          child: SizedBox(
            height: .125.sw,
            child: CustomTabbar(
              tabController: _tabController,
              border: false,
              tab: const ['350 Takipçi', '25 Takip'],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: .0125.sw),
              child: const UserCard(),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: .0125.sw),
              child: const UserCard(),
            ),
          ),
        ],
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      decoration: CardDecoration(),
      margin: EdgeInsets.symmetric(horizontal: .05.sw),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(10.w, 5.w, 10.w, 2.5.w),
            child: Row(
              children: <Widget>[
                const DefaultCircleAvatar(
                  'https://cdn1.ntv.com.tr/gorsel/LyBbdJvJuE2ULhdczuTgCQ.jpg?width=1000&mode=crop&scale=both',
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextSemiBold(
                            'Aslı Eralp',
                            fontSize: 11.sp,
                          ),
                          const FollowButton(status: true)
                        ],
                      ),
                      Container(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                CustomTextBold(
                                  242.toCompact,
                                  fontSize: 7.sp,
                                ),
                                SizedBox(width: .01.sw),
                                CustomTextLight(
                                  'Değerlendirme',
                                  fontSize: 7.sp,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: CustomTextBold(
                              'Rozetler',
                              fontSize: 7.sp,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                CustomTextBold(
                                  11.toCompact,
                                  fontSize: 7.sp,
                                ),
                                SizedBox(width: .01.sw),
                                CustomTextLight(
                                  'Takipçi',
                                  fontSize: 7.sp,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Icon(Icons.key_sharp, size: 15.w),
                                Icon(Icons.abc, size: 15.w),
                                Icon(Icons.hdr_strong, size: 15.w),
                                Icon(Icons.eight_k_rounded, size: 15.w),
                                Icon(Icons.add_outlined, size: 15.w),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(5.r),
            padding: EdgeInsets.symmetric(horizontal: .0125.sw, vertical: .02.sw),
            decoration: BoxDecoration(
              color: AppColor.light,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextSemiBold(
                      'La Torre',
                      fontSize: 11.sp,
                    ),
                    CustomTextMedium(
                      'Etiler, Beşiktaş/İstanbul',
                      fontSize: 7.sp,
                    ),
                  ],
                ),
                CustomTextMedium(
                  '30 dakika önce',
                  fontSize: 7.sp,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
