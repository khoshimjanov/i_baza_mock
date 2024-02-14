import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class TapBarItem extends StatelessWidget {
  final bool selected;
  final String icon;
  final String title;
  final Function() onTap;
  const TapBarItem({super.key,
    required this.icon,
    required this.title,
    required this.selected,
    required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          const Gap(15),
          SvgPicture.asset(icon,color: selected ? Colors.black : const Color(0xFF9E9EA5),),
          const Gap(4),
          Text(title,style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: selected ? Colors.black : const Color(0xFF9E9EA5)
          ),)
        ],
      ),
    );
  }
}
