import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';
import 'package:neyenir_app/src/config/icon/app_icon.dart';
import 'package:neyenir_app/src/core/components/button/follow_button.dart';
import 'package:neyenir_app/src/core/components/button/to_top_button.dart';
import 'package:neyenir_app/src/core/components/floating_action_button/rate_fab.dart';
import 'package:neyenir_app/src/core/components/tabbar/custom_tabbar.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';
import 'package:neyenir_app/src/core/functions/scroll_controller.dart';
import 'package:neyenir_app/src/presentation/bloc/application/application_bloc.dart';
import 'package:neyenir_app/src/presentation/view/map_view.dart';
import 'package:neyenir_app/src/presentation/view/post_view.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:neyenir_app/src/presentation/view/store_view.dart';

class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    ScrollListener.toTop(context: context, controller: _scrollController);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: SizedBox(
                height: .65.sw,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Positioned(
                      top: 0,
                      child: Image.network(
                        'https://cdn1.ntv.com.tr/gorsel/LyBbdJvJuE2ULhdczuTgCQ.jpg?width=1000&mode=crop&scale=both',
                        height: .645.sw,
                        width: 1.sw,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: .64.sw,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Colors.black45,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black54,
                            Colors.transparent,
                          ],
                          stops: [.1, .3, .6, .98, 1],
                        ),
                      ),
                    ),
                    Positioned(
                      right: .085.sw,
                      top: .05.sw,
                      child: const FollowButton(status: false, outline: false),
                    ),
                    Positioned(
                      left: .05.sw,
                      top: .05.sw,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () async {
                              await FlutterShare.share(
                                title: 'Nerde Ne Yenir?',
                                text: "Ne Yeniri Keşfet",
                                linkUrl: 'https://pangeapost.net/',
                                chooserTitle: 'Paylaşım seçenekleri');
                            },
                            icon: Icon(
                              AppIcon.share,
                              size: 18.sp,
                              color: Colors.white,
                            ),
                          ),
                          CustomTextMedium(
                            'Paylaş',
                            color: Colors.white,
                            fontSize: 11.sp,
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      left: .085.sw,
                      bottom: .125.sw,
                      child: CustomTextBlack(
                        'DALLAS STEAK',
                        color: Colors.white,
                        fontSize: 18.sp,
                      ),
                    ),
                    Positioned(
                      right: .085.sw,
                      bottom: .1.sw,
                      child: Column(
                        children: [
                          CustomTextBold(
                            '4.5',
                            color: Colors.white,
                            fontSize: 28.sp,
                          ),
                          CustomTextMedium(
                            'Popülarite',
                            color: Colors.white,
                            fontSize: 11.sp,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: .05.sw,
                      decoration: BoxDecoration(
                        color: AppColor.light,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20.sp)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              elevation: 0,
              flexibleSpace: CustomTabbar(
                tabController: _tabController,
                border: false,
                tab: const ['DENEYENLER', 'MEKANLAR'],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: .035.sw),
                  child: const PostView(),
                );
              },
            ),
            // // TODO check real device MapView()
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: .0125.sw),
            //   child: ListView.builder(
            //     physics: const NeverScrollableScrollPhysics(),
            //     shrinkWrap: true,
            //     itemCount: 15,
            //     itemBuilder: (context, index) => const StoreView(),
            //   ),
            // ),
            SecondTab(scrollController: _scrollController),
          ],
        ),
      ),
      floatingActionButton: BlocSelector<ApplicationBloc, ApplicationState, bool>(
        selector: (state) => state is ApplicationButtonShow ? true : false,
        builder: (context, status) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: .12.sw),
                child: const RateFAB(),
              ),
              AnimatedOpacity(
                opacity: status ? 1 : 0,
                duration: const Duration(milliseconds: 500),
                child: ToTopButton(scrollController: _scrollController),
              ),
            ],
          );
        },
      ),
    );
  }
}

class SecondTab extends StatefulWidget {
  const SecondTab({Key? key, required this.scrollController}) : super(key: key);
  final ScrollController scrollController;

  @override
  State<SecondTab> createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.index == 1) {
        widget.scrollController.animateTo(
          .3.sh,
          duration: const Duration(milliseconds: 200),
          curve: Curves.linear,
        );
        _scrollController.animateTo(
          .2.sh,
          duration: const Duration(milliseconds: 200),
          curve: Curves.linear,
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            elevation: 0,
            flexibleSpace: CustomTabbar(
              tabController: _tabController,
              border: false,
              tab: const ['Liste', 'Harita'],
            ),
          ),
        ];
      },
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: .0125.sw),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 15,
              itemBuilder: (context, index) => const StoreView(),
            ),
          ),
          const MapView(innerView: true),
        ],
      ),
    );
  }
}
