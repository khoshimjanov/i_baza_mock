import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class SquareWidget extends StatelessWidget {
  final String icon;
  final String title;
  final Function() onTap;
  const SquareWidget({super.key,
    required this.icon,
    required this.title,
    required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 101,height: 94,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12)
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(icon),
              ],
            ),
            const Gap(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title,style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600
                ),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
