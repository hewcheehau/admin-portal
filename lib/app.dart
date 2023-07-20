import 'dart:async';

import 'package:admin_portal/application/home/cubit/navigation_bar_cubit.dart';
import 'package:admin_portal/application/post/bloc/post_bloc.dart';
import 'package:admin_portal/infrastructure/constants/string_constants.dart';
import 'package:admin_portal/infrastructure/core/app_extension.dart';
import 'package:admin_portal/presentation/common_widget.dart/app_loading_widget.dart';
import 'package:admin_portal/presentation/core/app_color.dart';
import 'package:admin_portal/presentation/core/app_router.dart';
import 'package:admin_portal/service_locator.dart';
import 'package:after_layout/after_layout.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AdminPortalApp extends StatelessWidget {
  const AdminPortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = sl<AppRouter>();
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBarCubit>(
          create: (context) => NavigationBarCubit(),
        ),
        BlocProvider<PostBloc>(
          create: (context) => PostBloc(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: StringConstants.appTitle,
        theme: ThemeData(
          primaryColor: AppColor.mainColor,
        ),
        routeInformationParser: router.defaultRouteParser(),
        routerDelegate: AutoRouterDelegate(router, initialDeepLink: '/splash'),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
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
    /// Fake loading
    Future.delayed(const Duration(seconds: 1),
        () => context.router.replaceAll([const HomeRoute()]));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("app-ic".toPng(),),
            const SizedBox(
              height: 20,
            ),
            const AppLoadingWidget()
          ],
        ),
      ),
    );
  }
}
