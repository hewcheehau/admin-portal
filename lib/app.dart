import 'dart:async';

import 'package:admin_portal/application/home/cubit/navigation_bar_cubit.dart';
import 'package:admin_portal/infrastructure/constants/string_constants.dart';
import 'package:admin_portal/presentation/core/app_router.dart';
import 'package:admin_portal/service_locator.dart';
import 'package:after_layout/after_layout.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminPortalApp extends StatelessWidget {
  const AdminPortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = sl<AppRouter>();
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBarCubit>(create: (context) => NavigationBarCubit(),),
      ],
      child: MaterialApp.router(
        title: StringConstants.appTitle,
        routeInformationParser: router.defaultRouteParser(),
        routerDelegate: AutoRouterDelegate(router, initialDeepLink: '/splash'),
      ),
    );
  }
}

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with AfterLayoutMixin {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    Future.delayed(const Duration(seconds: 2), () => context.router.replaceAll([const HomeRoute()]));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(CupertinoIcons.airplane, size: 50,),
            SizedBox(height: 20,),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
