import 'package:flutter/material.dart';
import 'package:ibaza_mock_data/assets/constants/icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class TailWidgets extends StatelessWidget {
  final String icon;
  final String title;
  final Function() onTap;
  const TailWidgets(
      {super.key,
      required this.onTap,
      required this.icon,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8, right: 14),
        height: 52,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              SvgPicture.asset(icon),
              const Gap(12),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              SvgPicture.asset(AppIcons.arrowRight),
            ],
          ),
        ),
      ),
    );
  }
}
