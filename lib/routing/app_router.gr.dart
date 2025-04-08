// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:mvvm/features/details/details_page.dart' as _i1;
import 'package:mvvm/features/home/model/posts.dart' as _i7;
import 'package:mvvm/features/home/view/home_page.dart' as _i2;
import 'package:mvvm/features/settings/settings_page.dart' as _i3;
import 'package:mvvm/features/tab_bar/tab_bar.dart' as _i4;

/// generated route for
/// [_i1.DetailsPage]
class DetailsRoute extends _i5.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    _i6.Key? key,
    required _i7.Posts post,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         DetailsRoute.name,
         args: DetailsRouteArgs(key: key, post: post),
         initialChildren: children,
       );

  static const String name = 'DetailsRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailsRouteArgs>();
      return _i1.DetailsPage(key: args.key, post: args.post);
    },
  );
}

class DetailsRouteArgs {
  const DetailsRouteArgs({this.key, required this.post});

  final _i6.Key? key;

  final _i7.Posts post;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, post: $post}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}

/// generated route for
/// [_i3.SettingsPage]
class SettingsRoute extends _i5.PageRouteInfo<void> {
  const SettingsRoute({List<_i5.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.SettingsPage();
    },
  );
}

/// generated route for
/// [_i4.TabBar]
class TabBar extends _i5.PageRouteInfo<void> {
  const TabBar({List<_i5.PageRouteInfo>? children})
    : super(TabBar.name, initialChildren: children);

  static const String name = 'TabBar';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.TabBar();
    },
  );
}
