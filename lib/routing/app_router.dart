import 'package:auto_route/auto_route.dart';
import 'package:mvvm/routing/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: '/',
      page: TabBar.page,
      initial: true,
      children: [AutoRoute(path: 'home', page: HomeRoute.page), AutoRoute(path: 'settings', page: SettingsRoute.page)],
    ),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: DetailsRoute.page),
    AutoRoute(page: SettingsRoute.page),
    // AutoRoute(page: ),
  ];

  @override
  List<AutoRouteGuard> get guards => [];
}
