// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i9;
import 'package:stacked/stacked.dart' as _i8;
import 'package:stacked_services/stacked_services.dart' as _i7;

import '../ui/views/app_parent/app_parent_view.dart' as _i3;
import '../ui/views/home/home_view.dart' as _i2;
import '../ui/views/language_change/language_change_view.dart' as _i5;
import '../ui/views/startup/startup_view.dart' as _i1;
import '../ui/views/theme_change/theme_change_view.dart' as _i4;
import '../ui/views/unknown/unknown_view.dart' as _i6;

final stackedRouter =
    StackedRouterWeb(navigatorKey: _i7.StackedService.navigatorKey);

class StackedRouterWeb extends _i8.RootStackRouter {
  StackedRouterWeb({_i9.GlobalKey<_i9.NavigatorState>? navigatorKey})
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    StartupViewRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.StartupView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeViewRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    AppParentViewRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.AppParentView(),
      );
    },
    ThemeChangeViewRoute.name: (routeData) {
      final args = routeData.argsAs<ThemeChangeViewArgs>();
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.ThemeChangeView(
          key: args.key,
          isThemeChangeViewExpanded: args.isThemeChangeViewExpanded,
          onTap: args.onTap,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    LanguageChangeViewRoute.name: (routeData) {
      final args = routeData.argsAs<LanguageChangeViewArgs>();
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: _i5.LanguageChangeView(
          key: args.key,
          isLanguageChangeViewExpanded: args.isLanguageChangeViewExpanded,
          onTap: args.onTap,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    UnknownViewRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.UnknownView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          StartupViewRoute.name,
          path: '/',
        ),
        _i8.RouteConfig(
          HomeViewRoute.name,
          path: '/home-view',
        ),
        _i8.RouteConfig(
          AppParentViewRoute.name,
          path: '/app-parent-view',
        ),
        _i8.RouteConfig(
          ThemeChangeViewRoute.name,
          path: '/theme-change-view',
        ),
        _i8.RouteConfig(
          LanguageChangeViewRoute.name,
          path: '/language-change-view',
        ),
        _i8.RouteConfig(
          UnknownViewRoute.name,
          path: '/404',
        ),
        _i8.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/404',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.StartupView]
class StartupViewRoute extends _i8.PageRouteInfo<void> {
  const StartupViewRoute()
      : super(
          StartupViewRoute.name,
          path: '/',
        );

  static const String name = 'StartupView';
}

/// generated route for
/// [_i2.HomeView]
class HomeViewRoute extends _i8.PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '/home-view',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i3.AppParentView]
class AppParentViewRoute extends _i8.PageRouteInfo<void> {
  const AppParentViewRoute()
      : super(
          AppParentViewRoute.name,
          path: '/app-parent-view',
        );

  static const String name = 'AppParentView';
}

/// generated route for
/// [_i4.ThemeChangeView]
class ThemeChangeViewRoute extends _i8.PageRouteInfo<ThemeChangeViewArgs> {
  ThemeChangeViewRoute({
    _i9.Key? key,
    bool isThemeChangeViewExpanded = false,
    required dynamic Function({bool tileExpanded}) onTap,
  }) : super(
          ThemeChangeViewRoute.name,
          path: '/theme-change-view',
          args: ThemeChangeViewArgs(
            key: key,
            isThemeChangeViewExpanded: isThemeChangeViewExpanded,
            onTap: onTap,
          ),
        );

  static const String name = 'ThemeChangeView';
}

class ThemeChangeViewArgs {
  const ThemeChangeViewArgs({
    this.key,
    this.isThemeChangeViewExpanded = false,
    required this.onTap,
  });

  final _i9.Key? key;

  final bool isThemeChangeViewExpanded;

  final dynamic Function({bool tileExpanded}) onTap;

  @override
  String toString() {
    return 'ThemeChangeViewArgs{key: $key, isThemeChangeViewExpanded: $isThemeChangeViewExpanded, onTap: $onTap}';
  }
}

/// generated route for
/// [_i5.LanguageChangeView]
class LanguageChangeViewRoute
    extends _i8.PageRouteInfo<LanguageChangeViewArgs> {
  LanguageChangeViewRoute({
    _i9.Key? key,
    bool isLanguageChangeViewExpanded = false,
    required dynamic Function({bool tileExpanded}) onTap,
  }) : super(
          LanguageChangeViewRoute.name,
          path: '/language-change-view',
          args: LanguageChangeViewArgs(
            key: key,
            isLanguageChangeViewExpanded: isLanguageChangeViewExpanded,
            onTap: onTap,
          ),
        );

  static const String name = 'LanguageChangeView';
}

class LanguageChangeViewArgs {
  const LanguageChangeViewArgs({
    this.key,
    this.isLanguageChangeViewExpanded = false,
    required this.onTap,
  });

  final _i9.Key? key;

  final bool isLanguageChangeViewExpanded;

  final dynamic Function({bool tileExpanded}) onTap;

  @override
  String toString() {
    return 'LanguageChangeViewArgs{key: $key, isLanguageChangeViewExpanded: $isLanguageChangeViewExpanded, onTap: $onTap}';
  }
}

/// generated route for
/// [_i6.UnknownView]
class UnknownViewRoute extends _i8.PageRouteInfo<void> {
  const UnknownViewRoute()
      : super(
          UnknownViewRoute.name,
          path: '/404',
        );

  static const String name = 'UnknownView';
}

extension RouterStateExtension on _i7.RouterService {
  Future<dynamic> navigateToStartupView(
      {void Function(_i8.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToHomeView(
      {void Function(_i8.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToAppParentView(
      {void Function(_i8.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const AppParentViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToThemeChangeView({
    _i9.Key? key,
    bool isThemeChangeViewExpanded = false,
    required dynamic Function({bool tileExpanded}) onTap,
    void Function(_i8.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      ThemeChangeViewRoute(
        key: key,
        isThemeChangeViewExpanded: isThemeChangeViewExpanded,
        onTap: onTap,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToLanguageChangeView({
    _i9.Key? key,
    bool isLanguageChangeViewExpanded = false,
    required dynamic Function({bool tileExpanded}) onTap,
    void Function(_i8.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      LanguageChangeViewRoute(
        key: key,
        isLanguageChangeViewExpanded: isLanguageChangeViewExpanded,
        onTap: onTap,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToUnknownView(
      {void Function(_i8.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithStartupView(
      {void Function(_i8.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHomeView(
      {void Function(_i8.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithAppParentView(
      {void Function(_i8.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const AppParentViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithThemeChangeView({
    _i9.Key? key,
    bool isThemeChangeViewExpanded = false,
    required dynamic Function({bool tileExpanded}) onTap,
    void Function(_i8.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      ThemeChangeViewRoute(
        key: key,
        isThemeChangeViewExpanded: isThemeChangeViewExpanded,
        onTap: onTap,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithLanguageChangeView({
    _i9.Key? key,
    bool isLanguageChangeViewExpanded = false,
    required dynamic Function({bool tileExpanded}) onTap,
    void Function(_i8.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      LanguageChangeViewRoute(
        key: key,
        isLanguageChangeViewExpanded: isLanguageChangeViewExpanded,
        onTap: onTap,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithUnknownView(
      {void Function(_i8.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }
}
