import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibaza_mock_data/assets/constants/route_names/app_route.dart';
import 'package:ibaza_mock_data/core/pages/splash_screen.dart';
import 'package:ibaza_mock_data/features/home/home_page.dart';
import 'package:ibaza_mock_data/features/onboarding/onboarding.dart';

class AppRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    final String routeName = settings.name ?? '';

    switch (routeName) {
      case AppRouteNames.splash:
        return CupertinoPageRoute(builder: (context) => const HomePage());
      case AppRouteNames.home:
        return CupertinoPageRoute(builder: (context) => const HomePage());
      case AppRouteNames.onBoarding:
        return CupertinoPageRoute(builder: (context) => const OnBoarding());
      default:
        return CupertinoPageRoute(builder: (context) => const Scaffold());
    }
  }
}
