import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibaza_mock_data/assets/constants/route_names/catalog.dart';
import 'package:ibaza_mock_data/features/category/presentation/pages/category_screen.dart';

class CatalogRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    final String routeName = settings.name ?? '';

    switch (routeName) {
      case '/':
        return CupertinoPageRoute(builder: (context) => const CategoryScreen());
      case CatalogRouteNames.catalog:
        return CupertinoPageRoute(builder: (context) => const Scaffold());
      default:
    }
  }
}
