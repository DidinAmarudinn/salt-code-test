// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DetailNewsRoute.name: (routeData) {
      final args = routeData.argsAs<DetailNewsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailNewsScreen(
          key: args.key,
          article: args.article,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [DetailNewsScreen]
class DetailNewsRoute extends PageRouteInfo<DetailNewsRouteArgs> {
  DetailNewsRoute({
    Key? key,
    required Article article,
    List<PageRouteInfo>? children,
  }) : super(
          DetailNewsRoute.name,
          args: DetailNewsRouteArgs(
            key: key,
            article: article,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailNewsRoute';

  static const PageInfo<DetailNewsRouteArgs> page =
      PageInfo<DetailNewsRouteArgs>(name);
}

class DetailNewsRouteArgs {
  const DetailNewsRouteArgs({
    this.key,
    required this.article,
  });

  final Key? key;

  final Article article;

  @override
  String toString() {
    return 'DetailNewsRouteArgs{key: $key, article: $article}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
