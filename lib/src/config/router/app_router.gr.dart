// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const SplashView());
    },
    HomeRouter.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const EmptyRouterPage(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          opaque: true,
          barrierDismissible: false);
    },
    FilterRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const FilterView());
    },
    ProfileRouter.name: (routeData) {
      final args = routeData.argsAs<ProfileRouterArgs>();
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: ProfileView(key: args.key, profileEnums: args.profileEnums));
    },
    RatingRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const RatingView());
    },
    SuggestRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const SuggestView());
    },
    ProductRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const ProductView());
    },
    PopularFoodsRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const PopularFoodsView());
    },
    MapRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const MapView());
    },
    FollowRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const FollowView());
    },
    BadgesRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const BadgesView());
    },
    GourmetRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const GourmetsView());
    },
    StoreFoodRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const StoreFoodView());
    },
    ShareRateRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const ShareRateView());
    },
    HomeRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const HomeView());
    },
    FeedRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const FeedView());
    },
    SettingsRouter.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const SettingsView(),
          transitionsBuilder: slideLeft,
          durationInMilliseconds: 800,
          reverseDurationInMilliseconds: 800,
          opaque: true,
          barrierDismissible: false);
    },
    PersonalInformationRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const PersonalInformationView());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(SplashRouter.name, path: '/'),
        RouteConfig(HomeRouter.name, path: '/home', children: [
          RouteConfig(HomeRoute.name, path: '', parent: HomeRouter.name),
          RouteConfig(FeedRouter.name, path: 'feed', parent: HomeRouter.name),
          RouteConfig(SettingsRouter.name,
              path: 'settings', parent: HomeRouter.name),
          RouteConfig(PersonalInformationRouter.name,
              path: 'personal_info', parent: HomeRouter.name)
        ]),
        RouteConfig(FilterRouter.name, path: '/filter'),
        RouteConfig(ProfileRouter.name, path: '/profile'),
        RouteConfig(RatingRouter.name, path: '/rate'),
        RouteConfig(SuggestRouter.name, path: '/suggest'),
        RouteConfig(ProductRouter.name, path: '/product'),
        RouteConfig(PopularFoodsRouter.name, path: '/popular_foods'),
        RouteConfig(MapRouter.name, path: '/map'),
        RouteConfig(FollowRouter.name, path: '/follow'),
        RouteConfig(BadgesRouter.name, path: '/badges'),
        RouteConfig(GourmetRouter.name, path: '/gourmets'),
        RouteConfig(StoreFoodRouter.name, path: '/store_food'),
        RouteConfig(ShareRateRouter.name, path: '/share_rate')
      ];
}

/// generated route for
/// [SplashView]
class SplashRouter extends PageRouteInfo<void> {
  const SplashRouter() : super(SplashRouter.name, path: '/');

  static const String name = 'SplashRouter';
}

/// generated route for
/// [EmptyRouterPage]
class HomeRouter extends PageRouteInfo<void> {
  const HomeRouter({List<PageRouteInfo>? children})
      : super(HomeRouter.name, path: '/home', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [FilterView]
class FilterRouter extends PageRouteInfo<void> {
  const FilterRouter() : super(FilterRouter.name, path: '/filter');

  static const String name = 'FilterRouter';
}

/// generated route for
/// [ProfileView]
class ProfileRouter extends PageRouteInfo<ProfileRouterArgs> {
  ProfileRouter({Key? key, required ProfileEnums profileEnums})
      : super(ProfileRouter.name,
            path: '/profile',
            args: ProfileRouterArgs(key: key, profileEnums: profileEnums));

  static const String name = 'ProfileRouter';
}

class ProfileRouterArgs {
  const ProfileRouterArgs({this.key, required this.profileEnums});

  final Key? key;

  final ProfileEnums profileEnums;

  @override
  String toString() {
    return 'ProfileRouterArgs{key: $key, profileEnums: $profileEnums}';
  }
}

/// generated route for
/// [RatingView]
class RatingRouter extends PageRouteInfo<void> {
  const RatingRouter() : super(RatingRouter.name, path: '/rate');

  static const String name = 'RatingRouter';
}

/// generated route for
/// [SuggestView]
class SuggestRouter extends PageRouteInfo<void> {
  const SuggestRouter() : super(SuggestRouter.name, path: '/suggest');

  static const String name = 'SuggestRouter';
}

/// generated route for
/// [ProductView]
class ProductRouter extends PageRouteInfo<void> {
  const ProductRouter() : super(ProductRouter.name, path: '/product');

  static const String name = 'ProductRouter';
}

/// generated route for
/// [PopularFoodsView]
class PopularFoodsRouter extends PageRouteInfo<void> {
  const PopularFoodsRouter()
      : super(PopularFoodsRouter.name, path: '/popular_foods');

  static const String name = 'PopularFoodsRouter';
}

/// generated route for
/// [MapView]
class MapRouter extends PageRouteInfo<void> {
  const MapRouter() : super(MapRouter.name, path: '/map');

  static const String name = 'MapRouter';
}

/// generated route for
/// [FollowView]
class FollowRouter extends PageRouteInfo<void> {
  const FollowRouter() : super(FollowRouter.name, path: '/follow');

  static const String name = 'FollowRouter';
}

/// generated route for
/// [BadgesView]
class BadgesRouter extends PageRouteInfo<void> {
  const BadgesRouter() : super(BadgesRouter.name, path: '/badges');

  static const String name = 'BadgesRouter';
}

/// generated route for
/// [GourmetsView]
class GourmetRouter extends PageRouteInfo<void> {
  const GourmetRouter() : super(GourmetRouter.name, path: '/gourmets');

  static const String name = 'GourmetRouter';
}

/// generated route for
/// [StoreFoodView]
class StoreFoodRouter extends PageRouteInfo<void> {
  const StoreFoodRouter() : super(StoreFoodRouter.name, path: '/store_food');

  static const String name = 'StoreFoodRouter';
}

/// generated route for
/// [ShareRateView]
class ShareRateRouter extends PageRouteInfo<void> {
  const ShareRateRouter() : super(ShareRateRouter.name, path: '/share_rate');

  static const String name = 'ShareRateRouter';
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [FeedView]
class FeedRouter extends PageRouteInfo<void> {
  const FeedRouter() : super(FeedRouter.name, path: 'feed');

  static const String name = 'FeedRouter';
}

/// generated route for
/// [SettingsView]
class SettingsRouter extends PageRouteInfo<void> {
  const SettingsRouter() : super(SettingsRouter.name, path: 'settings');

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [PersonalInformationView]
class PersonalInformationRouter extends PageRouteInfo<void> {
  const PersonalInformationRouter()
      : super(PersonalInformationRouter.name, path: 'personal_info');

  static const String name = 'PersonalInformationRouter';
}
