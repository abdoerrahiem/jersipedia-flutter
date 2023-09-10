import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jersipedia/utils/theme.dart';
import 'package:jersipedia/widgets/profile_button.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50, child: Container(color: blueColor)),
          profileHeader(),
          profileButtons(context),
        ],
      ),
    );
  }
}

Widget profileHeader() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(
      vertical: 15,
      horizontal: 15,
    ),
    decoration: BoxDecoration(
      color: blueColor,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: Image.network(
              'https://plus.unsplash.com/premium_photo-1669748157807-30514e416843?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fHww&auto=format&fit=crop&w=400&q=60',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: Text(
            'Abdur Rahim',
            style: whiteTextStyle.copyWith(
              fontSize: 20,
              fontWeight: fontWeightBold,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Icon(
              Icons.phone,
              color: whiteColor,
              size: 24,
            ),
            const SizedBox(width: 10),
            Text(
              '+6289694624299',
              style: whiteTextStyle.copyWith(),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: whiteColor,
              size: 24,
            ),
            const SizedBox(width: 10),
            Text(
              'Mempawah, Indonesia',
              style: whiteTextStyle.copyWith(),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget profileButtons(BuildContext context) {
  return Column(
    children: [
      const SizedBox(height: 20),
      ProfileButton(
        icon: Icons.manage_accounts,
        title: 'Ubah Profil',
        onPress: () {
          Navigator.pushNamed(context, '/change-profile');
        },
      ),
      ProfileButton(
        icon: Icons.lock,
        title: 'Ubah Password',
        onPress: () {
          Navigator.pushNamed(context, '/change-password');
        },
      ),
      ProfileButton(
        icon: Icons.history,
        title: 'History Checkout',
        onPress: () {
          Navigator.pushNamed(context, '/history-checkout');
        },
      ),
      ProfileButton(
        icon: Icons.logout,
        title: 'Keluar',
        onPress: () async {
          const storage = FlutterSecureStorage();
          await storage.deleteAll();
          if (context.mounted) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', (route) => false);
          }
        },
      ),
    ],
  );
}
