import 'package:flutter/material.dart';
import 'package:ibaza_mock_data/assets/constants/colors.dart';
import 'package:ibaza_mock_data/features/auth/data/data_source/data_source.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../assets/constants/icons.dart';
import '../../../../../assets/constants/route_names/profile.dart';
import '../widgets/exit.dart';
import '../widgets/user_data.dart';
import 'edit_profile.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      ProfileRouteNames.profile, (_) => false);
                },
                child: SvgPicture.asset(AppIcons.arrowBack)),
            const Spacer(),
            const Text(
              "Profil ma’lumotlari",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const Spacer(),
          ],
        ),
      ),
      backgroundColor: background,
      body: Column(
        children: [
          UserDataUi(
            user: user,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditProfileScreen(),
                ),
              );
            },
          ),
          const ExitButton(),
        ],
      ),
    );
  }
}
