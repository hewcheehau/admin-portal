import 'package:admin_portal/app.dart';
import 'package:admin_portal/presentation/screen/home/home_screen.dart';
import 'package:admin_portal/presentation/screen/post/post_details_screen.dart';
import 'package:admin_portal/presentation/screen/post/post_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true, path: "/splash"),
        AutoRoute(page: HomeRoute.page, path: "/home",
        children: [
          AutoRoute(page: PostRoute.page, path: "post/:id", initial: true, usesPathAsKey: true),
          AutoRoute(page: PostDetailsRoute.page, path: ":id/comments"),
        ]),
        
        
      ];
}
