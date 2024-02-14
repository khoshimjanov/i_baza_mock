import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../assets/constants/icons.dart';
import '../../assets/constants/images.dart';
import '../../assets/constants/route_names/app_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
     

      Navigator.of(context).pushNamedAndRemoveUntil(AppRouteNames.onBoarding, (_) => false);

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.background),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
               SvgPicture.asset(AppIcons.mainLogo),
                const Spacer(),
                const CupertinoActivityIndicator(
                  radius: 16,
                ),
                const SizedBox(height: 40,)
              ],
            )
          ),
        );
      }
}
