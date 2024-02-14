import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../assets/constants/icons.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(AppIcons.arrowBack),
            const Gap(90),
            const Text("Xabarnomalar",style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16
              ),
            )
          ],
        ),
      ),
    );
  }
}
