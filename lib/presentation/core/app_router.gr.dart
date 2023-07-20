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
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    PostDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PostDetailsRouteArgs>(
          orElse: () => PostDetailsRouteArgs(
                  id: pathParams.optInt(
                'id',
                -1,
              )));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PostDetailsScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    PostRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PostRouteArgs>(
          orElse: () => PostRouteArgs(id: pathParams.optInt('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PostScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
  };
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
/// [PostDetailsScreen]
class PostDetailsRoute extends PageRouteInfo<PostDetailsRouteArgs> {
  PostDetailsRoute({
    Key? key,
    int? id = -1,
    List<PageRouteInfo>? children,
  }) : super(
          PostDetailsRoute.name,
          args: PostDetailsRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'PostDetailsRoute';

  static const PageInfo<PostDetailsRouteArgs> page =
      PageInfo<PostDetailsRouteArgs>(name);
}

class PostDetailsRouteArgs {
  const PostDetailsRouteArgs({
    this.key,
    this.id = -1,
  });

  final Key? key;

  final int? id;

  @override
  String toString() {
    return 'PostDetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [PostScreen]
class PostRoute extends PageRouteInfo<PostRouteArgs> {
  PostRoute({
    Key? key,
    int? id,
    List<PageRouteInfo>? children,
  }) : super(
          PostRoute.name,
          args: PostRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'PostRoute';

  static const PageInfo<PostRouteArgs> page = PageInfo<PostRouteArgs>(name);
}

class PostRouteArgs {
  const PostRouteArgs({
    this.key,
    this.id,
  });

  final Key? key;

  final int? id;

  @override
  String toString() {
    return 'PostRouteArgs{key: $key, id: $id}';
  }
}
