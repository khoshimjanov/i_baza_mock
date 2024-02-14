import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../assets/constants/icons.dart';

class LangButton extends StatelessWidget {
  const LangButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppIcons.flagUZB),
        const Gap(8),
        const Text(
          'O\'zbekcha',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const Gap(7),
        SvgPicture.asset(AppIcons.arrowEnd),

      ],
    );
  }
}
