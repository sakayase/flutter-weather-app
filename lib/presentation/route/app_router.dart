import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/presentation/landing_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: LandingRoute.page, path: '/')
  ];
}
