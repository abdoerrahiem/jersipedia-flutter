import 'package:flutter/material.dart';
import 'package:jersipedia/utils/theme.dart';
import 'package:jersipedia/widgets/text_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController =
        TextEditingController(text: '');

    return Scaffold(
      backgroundColor: blueColor,
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            children: [
              const SizedBox(height: 50),
              Align(
                child: Image.asset(
                  'assets/images/jersipedia.png',
                  width: 130,
                  height: 130,
                ),
              ),
              const SizedBox(height: 50),
              TextInput(
                controller: emailController,
                placeholder: 'Input your email',
                title: 'Email',
              ),
              const SizedBox(height: 20),
              TextInput(
                controller: emailController,
                placeholder: 'Input your password',
                title: 'Password',
                isPassword: true,
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: whiteColor),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    shadowColor: whiteColor,
                  ),
                  child: Text(
                    'Login',
                    style: whiteTextStyle.copyWith(),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Belum punya akun?',
                  style: whiteTextStyle.copyWith(),
                ),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: blackColor),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    shadowColor: whiteColor,
                  ),
                  child: Text(
                    'Register',
                    style: blackTextStyle.copyWith(),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/football_team.png',
              width: 200,
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}
