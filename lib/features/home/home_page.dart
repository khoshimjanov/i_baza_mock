import 'package:flutter/material.dart';
import 'package:ibaza_mock_data/assets/constants/routes/main.dart';
import 'package:ibaza_mock_data/core/widgets/tabbar_item.dart';

import '../../assets/constants/icons.dart';
import '../../assets/constants/routes/bin.dart';
import '../../assets/constants/routes/catalog.dart';
import '../../assets/constants/routes/orders.dart';
import '../../assets/constants/routes/profile.dart';
import 'destination.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController homePageController;

  var index = 0;

  @override
  void initState() {
    homePageController = PageController(keepPage: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: index,
              children: const [
                DestinationPage(
                  onGenerateRoute: MainRoute.onGenerateRoute,
                ),
                DestinationPage(
                  onGenerateRoute: CatalogRoute.onGenerateRoute,
                ),
                DestinationPage(
                  onGenerateRoute: OrdersRoute.onGenerateRoute,
                ),
                DestinationPage(
                  onGenerateRoute: BinRoute.onGenerateRoute,
                ),
                DestinationPage(
                  onGenerateRoute: ProfileRoute.onGenerateRoute,
                ),
              ],
            ),
          ),
          SizedBox(
              width: double.maxFinite,
              height: 60 + MediaQuery.of(context).padding.bottom,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TapBarItem(
                        selected: index == 0,
                        icon: AppIcons.main,
                        title: "Asosiy",
                        onTap: () {
                          index = 0;
                          setState(() {});
                        }),
                    TapBarItem(
                        selected: index == 1,
                        icon: AppIcons.catalog,
                        title: "Katalog",
                        onTap: () {
                          index = 1;
                          setState(() {});
                        }),
                    TapBarItem(
                        selected: index == 2,
                        icon: AppIcons.orders,
                        title: "Buyurtmalar",
                        onTap: () {
                          index = 2;
                          setState(() {});
                        }),
                    TapBarItem(
                        selected: index == 3,
                        icon: AppIcons.bin,
                        title: "Savatcha",
                        onTap: () {
                          index = 3;
                          setState(() {});
                        }),
                    TapBarItem(
                        selected: index == 4,
                        icon: AppIcons.profile,
                        title: "Profil",
                        onTap: () {
                          index = 4;
                          setState(() {});
                        }),
                  ])),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // homePageController.dispose();
    super.dispose();
  }
}
