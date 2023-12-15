import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:neyenir_app/src/core/enums/profile_enums.dart';
import 'package:neyenir_app/src/presentation/view/badges_view.dart';
import 'package:neyenir_app/src/presentation/view/feed_view.dart';
import 'package:neyenir_app/src/presentation/view/filter_view.dart';
import 'package:neyenir_app/src/presentation/view/follow_view.dart';
import 'package:neyenir_app/src/presentation/view/gourmets_view.dart';
import 'package:neyenir_app/src/presentation/view/home_view.dart';
import 'package:neyenir_app/src/presentation/view/map_view.dart';
import 'package:neyenir_app/src/presentation/view/popular_foods_view.dart';
import 'package:neyenir_app/src/presentation/view/product_view.dart';
import 'package:neyenir_app/src/presentation/view/settings_view.dart';
import 'package:neyenir_app/src/presentation/view/personal_information_view.dart';
import 'package:neyenir_app/src/presentation/view/profile_view.dart';
import 'package:neyenir_app/src/presentation/view/rating_view.dart';
import 'package:neyenir_app/src/presentation/view/share_rate_view.dart';
import 'package:neyenir_app/src/presentation/view/splash_view.dart';
import 'package:neyenir_app/src/presentation/view/store_food_view.dart';
import 'package:neyenir_app/src/presentation/view/suggest_view.dart';

part 'app_router.gr.dart';

/// `AppRouter` is a class that extends `_$AppRouter` and is used to generate a `Router` object
@AdaptiveAutoRouter(
  // * for names
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      name: 'SplashRouter',
      page: SplashView,
      initial: true,
    ),
    CustomRoute(
      path: '/home',
      name: 'HomeRouter',
      page: EmptyRouterPage,
      transitionsBuilder: TransitionsBuilders.noTransition,
      children: [
        AutoRoute(path: '', page: HomeView),
        AutoRoute(
          path: 'feed',
          page: FeedView,
          name: 'FeedRouter',
        ),
        CustomRoute(
          path: 'settings',
          page: SettingsView,
          name: 'SettingsRouter',
          transitionsBuilder: slideLeft,
          durationInMilliseconds: 800,
          reverseDurationInMilliseconds: 800,
        ),
        AutoRoute(
          path: 'personal_info',
          page: PersonalInformationView,
          name: 'PersonalInformationRouter',
        ),
      ],
    ),
    AutoRoute(
      path: '/filter',
      page: FilterView,
      name: 'FilterRouter',
    ),
    AutoRoute(
      path: '/profile',
      page: ProfileView,
      name: 'ProfileRouter',
    ),
    AutoRoute(
      path: '/rate',
      page: RatingView,
      name: 'RatingRouter',
    ),
    AutoRoute(
      path: '/suggest',
      page: SuggestView,
      name: 'SuggestRouter',
    ),
    AutoRoute(
      path: '/product',
      page: ProductView,
      name: 'ProductRouter',
    ),
    AutoRoute(
      path: '/popular_foods',
      page: PopularFoodsView,
      name: 'PopularFoodsRouter',
    ),
    AutoRoute(
      path: '/map',
      page: MapView,
      name: 'MapRouter',
    ),
    AutoRoute(
      path: '/follow',
      page: FollowView,
      name: 'FollowRouter',
    ),
    AutoRoute(
      path: '/badges',
      page: BadgesView,
      name: 'BadgesRouter',
    ),
    AutoRoute(
      path: '/gourmets',
      page: GourmetsView,
      name: 'GourmetRouter',
    ),
    AutoRoute(
      path: '/store_food',
      page: StoreFoodView,
      name: 'StoreFoodRouter',
    ),
    AutoRoute(
      path: '/share_rate',
      page: ShareRateView,
      name: 'ShareRateRouter',
    ),
  ],
)

/// `AppRouter` is a class that extends `_` and is used to generate a `Router` object
class AppRouter extends _$AppRouter {}

Widget slideLeft(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  // you get an animation object and a widget
  // make your own transition
  return SlideTransition(
    position: Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animation,
        curve: Curves.easeInCubic,
      ),
    ),
    child: child,
  );
}
