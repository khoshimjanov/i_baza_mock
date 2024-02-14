import 'package:flutter/cupertino.dart';
import 'package:ibaza_mock_data/features/home/profile/presentation/pages/main_profile.dart';
import 'package:ibaza_mock_data/features/home/profile/presentation/pages/profile.dart';

import '../route_names/profile.dart';

class ProfileRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    final String routeName = settings.name ?? '';

    switch (routeName) {
      case '/':
        return CupertinoPageRoute(builder: (context) => MainProfile());
      case ProfileRouteNames.mainProfile:
        return CupertinoPageRoute(builder: (context) => Profile());
      default:
    }
  }
}
