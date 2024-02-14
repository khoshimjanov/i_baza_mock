import 'package:flutter/material.dart';
import 'package:ibaza_mock_data/assets/constants/colors.dart';
import 'package:ibaza_mock_data/assets/constants/icons.dart';
import 'package:ibaza_mock_data/features/auth/data/models/authenticated_user.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class UserDataUi extends StatelessWidget {
  final Function() onTap;
  final AuthenticatedUserModel? user;
  const UserDataUi({super.key, required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 20, right: 20, bottom: 16),
      child: Container(
        padding:
            const EdgeInsets.only(top: 16, left: 20, right: 20, bottom: 20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  AppIcons.editPenBg,
                  color: Colors.white,
                ),
                Container(
                    width: 72,
                    height: 72,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: user?.picture == null
                        ? const Icon(Icons.person, size: 70, color: Colors.grey)
                        : Image.asset(
                            user!.picture!,
                            fit: BoxFit.cover,
                          )),
                GestureDetector(
                    onTap: onTap, child: SvgPicture.asset(AppIcons.editPenBg))
              ],
            ),
            const Gap(20),
            const Text(
              "F.I.Sh",
              style: TextStyle(color: grey, fontWeight: FontWeight.w600),
            ),
            Text(
              '${user?.lastName ?? 'Shoxrux'} ${user?.firstName ?? 'Shavqiyev'}',
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
            ),
            const Gap(16),
            const Text(
              "Manzilingiz",
              style: TextStyle(color: grey, fontWeight: FontWeight.w600),
            ),
            Text(
              user?.address ??
                  'Toshkent shahar, Mirobod tumani Fidokor ko‘chasi',
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
