import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/main.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';
import 'package:neyenir_app/src/config/icon/app_icon.dart';
import 'package:neyenir_app/src/config/router/app_router.dart';
import 'package:neyenir_app/src/core/components/dialogs/force_location_permissions.dart';
import 'package:neyenir_app/src/core/components/button/primary_button.dart';
import 'package:neyenir_app/src/core/components/button/secondary_button.dart';
import 'package:neyenir_app/src/core/components/button/to_top_button.dart';
import 'package:neyenir_app/src/core/components/circle_avatar/default_circle_avatar.dart';
import 'package:neyenir_app/src/core/components/fields/location_text_form_field.dart';
import 'package:neyenir_app/src/core/components/floating_action_button/rate_fab.dart';
import 'package:neyenir_app/src/core/components/image/darken_image.dart';
import 'package:neyenir_app/src/core/components/image/gourmet_image.dart';
import 'package:neyenir_app/src/core/components/padding/page_padding.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';
import 'package:neyenir_app/src/core/components/texts/neyenir_banner.dart';
import 'package:neyenir_app/src/core/components/texts/notification_badge.dart';
import 'package:neyenir_app/src/core/enums/profile_enums.dart';
import 'package:neyenir_app/src/presentation/bloc/location/location_bloc.dart';
import 'package:neyenir_app/src/presentation/view/filter_view.dart';
import 'package:neyenir_app/src/presentation/view/post_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late TabController _tabController;

  final sehir = List<SelectableLabels>.generate(
      8, (i) => i == 0 ? const SelectableLabels('Tüm Şehir') : SelectableLabels('$i'));

  @override
  void initState() {
    _scrollController = ScrollController();
    _tabController = TabController(length: 2, vsync: this);
    context.read<LocationBloc>().add(const OnDetermineLocation());
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationBloc, LocationState>(
      listener: (context, state) {
        if (state is LocationError) {
          forceLocationPermissions(context, state);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              const NotificationBadge(1),
              IconButton(
                onPressed: () => router.push(const SettingsRouter()),
                icon: const Icon(Icons.menu),
              )
            ],
          ),
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0.075.sw, 0, 0.075.sw, 0.025.sw),
                  child: const NeyenirBanner(),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.075.sw, 0, 0.075.sw, 0.025.sw),
                  child: const LocationTextFormField(withButton: true),
                ),
                Padding(
                padding: EdgeInsets.fromLTRB(0.025.sw, 0, 0.075.sw, 0.025.sw),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomTextMedium('Civardaki Popüler'),
                    Container(
                      constraints: BoxConstraints(maxHeight: 60, maxWidth: 1.sw),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Colors.grey, width: 0.25),
                        ),
                        child: SizedBox(
                          height: .035.sh,
                          child: TabBar(
                            controller: _tabController,
                            isScrollable: true,
                            indicatorSize: TabBarIndicatorSize.tab,
                            unselectedLabelColor: AppColor.primary,
                            labelColor: Colors.white,
                            indicator: BoxDecoration(
                              color: AppColor.primary,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            tabs: [
                              Tab(child: CustomTextMedium('YİYECEKLER', fontSize: 10.sp)),
                              Tab(child: CustomTextMedium('İÇECEKLER', fontSize: 10.sp)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0.025.sw),
                  constraints: BoxConstraints(maxHeight: .1.sw, maxWidth: 1.sw),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.separated(
                        separatorBuilder: (context, index) =>
                            const VerticalDivider(color: AppColor.light),
                        itemCount: 8,
                        padding: EdgeInsets.symmetric(horizontal: 0.075.sw),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: CustomPadding.symmetric(),
                            decoration: BoxDecoration(
                              color: index == 0 ? AppColor.primary : Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: CustomTextLight(
                              '${index * index}',
                              color: index == 0 ? Colors.white : AppColor.primary,
                            ),
                          );
                        },
                      ),
                      ListView.separated(
                        separatorBuilder: (context, index) =>
                            const VerticalDivider(color: AppColor.light),
                        itemCount: 8,
                        padding: EdgeInsets.symmetric(horizontal: 0.075.sw),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: CustomPadding.symmetric(),
                            decoration: BoxDecoration(
                              color: index == 0 ? AppColor.primary : Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: CustomTextLight(
                              '${index * index}',
                              color: index == 0 ? Colors.white : AppColor.primary,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: .1.sh,
                  width: 1.sh,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => VerticalDivider(
                      color: AppColor.light,
                      width: .01.sh,
                    ),
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 0.075.sw),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => router.push(const ProductRouter()),
                        child: SizedBox(
                          height: .12.sh,
                          width: .185.sh,
                          child: const DarkenImage(
                            name: 'DALLAS STEAK',
                            url:
                                'http://www.haketsteakhouse.net/wp-content/uploads/2021/02/dallas-600-650-gr.jpg',
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  width: 1.sw,
                  padding: CustomPadding.symmetric(),
                  child: SecondaryButton(
                    title: 'Civardaki Tüm Popüler Lezzetleri Keşfet',
                    onPressed: () => router.push(const PopularFoodsRouter()),
                  ),
                ),
                Container(
                  padding: CustomPadding.symmetric(),
                  child: CustomTextSemiBold('Civardaki Gurmeleri Keşfet', fontSize: 14.sp),
                ),
                SizedBox(
                  height: .15.sh,
                  width: 1.sh,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => VerticalDivider(
                      color: AppColor.light,
                      width: .01.sw,
                      thickness: 0,
                    ),
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 0.075.sw),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => router.push(const GourmetRouter()),
                        child: Column(
                          children: [
                            SizedBox(
                              width: .175.sw,
                              child: const DefaultCircleAvatar(
                                  'http://www.haketsteakhouse.net/wp-content/uploads/2021/02/dallas-600-650-gr.jpg'),
                            ),
                            SizedBox(height: .025.sw),
                            Container(
                              constraints: BoxConstraints(maxWidth: .2.sw),
                              child: CustomTextMedium('Ali Veli Kemal', fontSize: 8.sp),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 0.175.sw,
                  width: 1.sw,
                  margin: EdgeInsets.symmetric(horizontal: .015.sw),
                  padding: EdgeInsets.symmetric(horizontal: .075.sw),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(12.sp)),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white,
                        AppColor.light,
                      ],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextSemiBold('Takip Ettiğin Gurmeler', fontSize: 14.sp),
                      PrimaryButton(
                        title: "Filtrele",
                        icon: Icons.filter_list,
                        outline: true,
                        onPressed: () => router.push(const FilterRouter()),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: .035.sw),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) => const PostView(),
                  ),
                ),
                Center(
                  child: PrimaryButton(
                    title: 'Tümünü Gör',
                    onPressed: () => router.push(const FeedRouter()),
                  ),
                ),
                SizedBox(height: .05.sh),
                Center(
                  child: Padding(
                    padding: CustomPadding.symmetric(),
                    child: const CustomTextMedium('Popüler Gurmelerin Tavsiylerini Keşfet'),
                  ),
                ),
                SizedBox(height: .02.sh),
                SizedBox(
                  height: .6.sw,
                  width: 1.sw,
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const VerticalDivider(color: AppColor.light),
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 0.075.sw),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => router.push(ProfileRouter(profileEnums: ProfileEnums.user)),
                        child: const GourmetImage(
                          name: 'Vedat Milor',
                          url: 'https://listelist.com/wp-content/uploads/2018/11/vedat-milor-7.jpg',
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: .02.sh),
                ToTopButton(scrollController: _scrollController),
                SizedBox(height: .1.sh)
              ],
            ),
          ),
          floatingActionButton: const RateFAB(),
          floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
        );
      },
    );
  }
}
