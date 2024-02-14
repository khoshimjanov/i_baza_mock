import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    final String routeName = settings.name ?? '';


    switch (routeName) {
      case '/':
        return CupertinoPageRoute(builder: (context) => Scaffold());
      // case TaskRouteNames.notification:
      //   return CupertinoPageRoute(builder: (context) => NotificationPage());
      default:
    }
  }
}

