import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrdersRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    final String routeName = settings.name ?? '';


    switch (routeName) {
      case '/':
        return CupertinoPageRoute(builder: (context) => Scaffold());
      // case OrdersRouteNames.catalog:
      //   return CupertinoPageRoute(builder: (context) => Scaffold());
      default:
    }
  }
}

