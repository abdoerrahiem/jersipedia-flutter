import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jersipedia/blocs/user/user_bloc.dart';
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
  return Builder(builder: (context) {
    final userState = context.watch<UserBloc>().state;

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
          if (userState is CurrentUserSuccess)
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: Image.network(
                  userState.user.photo.toString(),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              userState is CurrentUserSuccess
                  ? userState.user.name.toString()
                  : '',
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
                userState is CurrentUserSuccess
                    ? userState.user.phone.toString()
                    : '',
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
                userState is CurrentUserSuccess
                    ? userState.user.address.toString()
                    : '',
                style: whiteTextStyle.copyWith(),
              ),
            ],
          ),
        ],
      ),
    );
  });
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
