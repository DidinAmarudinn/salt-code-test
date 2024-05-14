import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/article.dart';
import '../../presentations/screen/detail_news_screen.dart';
import '../../presentations/screen/home_screen.dart';
import '../../presentations/screen/splash_screen.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: HomeRoute.page,
        ),
        AutoRoute(
          page: DetailNewsRoute.page,
        ),
      ];
}
