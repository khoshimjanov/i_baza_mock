import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BinRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    final String routeName = settings.name ?? '';


    switch (routeName) {
      case '/':
        return CupertinoPageRoute(builder: (context) => Scaffold());
      default:
    }
  }
}

