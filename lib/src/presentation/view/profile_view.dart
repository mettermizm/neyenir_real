import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/main.dart';
import 'package:neyenir_app/src/config/router/app_router.dart';
import 'package:neyenir_app/src/core/components/image/darken_image.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';
import 'package:neyenir_app/src/core/enums/profile_enums.dart';
import 'package:neyenir_app/src/presentation/view/post_view.dart';
import 'package:neyenir_app/src/presentation/view/store_view.dart';
import 'package:neyenir_app/src/presentation/widget/profile/profile_header/profile_detail_widget.dart';
import 'package:neyenir_app/src/presentation/widget/profile/profile_header/profile_header.dart';
import 'package:neyenir_app/src/presentation/widget/profile/profile_header/profile_info_widget.dart';
import 'package:neyenir_app/src/presentation/widget/profile/profile_header/profile_status_widget.dart';
import 'package:neyenir_app/src/presentation/widget/profile/profile_tabbar/profile_tabbar.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key, required this.profileEnums}) : super(key: key);

  final ProfileEnums profileEnums;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late final PageController _pageController;
  double _selectedIndex = 0.0;

  @override
  void initState() {
    _decideTabControllerLength();
    _pagination();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _decideTabControllerLength() {
    if (widget.profileEnums == ProfileEnums.me || widget.profileEnums == ProfileEnums.user) {
      _tabController = TabController(length: 2, vsync: this);
    } else {
      _tabController = TabController(length: 3, vsync: this);
    }
  }

  void _pagination() {
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        _selectedIndex = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PROFILE')),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(child: SizedBox(height: .01.sh)),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: .05.sw),
                child: ProfileHeader(
                  details: ProfileDetailWidget(profileEnums: widget.profileEnums),
                  info: ProfileInfoWidget(
                    profileEnums: widget.profileEnums,
                    pageController: _pageController,
                  ),
                  status: ProfileStatusWidget(profileEnums: widget.profileEnums),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: .02.sh)),
            if (_selectedIndex < 0.5) ...[
              SliverAppBar(
                pinned: true,
                automaticallyImplyLeading: false,
                elevation: 0,
                flexibleSpace: ProfileTabbar(
                  tabController: _tabController,
                  profileEnums: widget.profileEnums,
                ),
              )
            ]
          ];
        },
        body: PageView(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          children: [
            /// When _pageController == 0
            TabBarView(
              controller: _tabController,
              children:
                  widget.profileEnums == ProfileEnums.user || widget.profileEnums == ProfileEnums.me
                      ? userAndMe()
                      : storeAndEmployee(),
            ),

            /// When _pageController == 1
            Padding(
              padding: EdgeInsets.fromLTRB(.05.sw, .0125.sw, .05.sw, 0),
              child: GridView.builder(
                itemCount: 5,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 7.5.w,
                  mainAxisSpacing: 25.h,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => router.push(ProfileRouter(profileEnums: ProfileEnums.employee)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(16.r)),
                            child: Image.network(
                              'https://img.freepik.com/free-photo/cheerful-young-cook-uniform-holding-salad-pointing-you_171337-5344.jpg?w=900&t=st=1662116470~exp=1662117070~hmac=e3957f0f1c28771beabd61ab2f3b2e6730c30e2f8b29feb7b04ee19a9495778a',
                              fit: BoxFit.cover,
                              scale: 1,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        const CustomTextSemiBold('Mehmet Şengül'),
                        SizedBox(height: 5.h),
                        CustomTextMedium('Şef', fontSize: 11.sp),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> userAndMe() {
    return [
      ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: .0325.sw),
          child: const PostView(ownPost: true),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: .0125.sw),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index) => const StoreView(),
        ),
      ),
    ];
  }

  List<Widget> storeAndEmployee() {
    return [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: .05.sw),
        child: GridView.builder(
          itemCount: 4,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.7,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => router.push(const StoreFoodRouter()),
              child: const DarkenImage(
                name: 'DALLAS STEAK',
                url:
                    'http://www.haketsteakhouse.net/wp-content/uploads/2021/02/dallas-600-650-gr.jpg',
              ),
            );
          },
        ),
      ),
      ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: .0325.sw),
          child: const PostView(),
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(.05.sw, .0125.sw, .05.sw, 0),
        child: GridView.builder(
          itemCount: 14,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16.r)),
                image: const DecorationImage(
                  image: NetworkImage(
                      'http://www.haketsteakhouse.net/wp-content/uploads/2021/02/dallas-600-650-gr.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    ];
  }
}
