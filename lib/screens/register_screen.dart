import 'package:flutter/material.dart';
import 'package:jersipedia/utils/theme.dart';
import 'package:jersipedia/widgets/text_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController =
        TextEditingController(text: '');
    final TextEditingController emailController =
        TextEditingController(text: '');
    final TextEditingController phoneController =
        TextEditingController(text: '');
    final TextEditingController passwordController =
        TextEditingController(text: '');

    return Scaffold(
      backgroundColor: blueColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        children: [
          const SizedBox(height: 50),
          Align(
            child: Image.asset(
              'assets/images/register1.png',
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.width / 1.5,
              fit: BoxFit.cover,
            ),
          ),
          TextInput(
            controller: nameController,
            placeholder: 'Name',
            title: 'Name',
          ),
          const SizedBox(height: 20),
          TextInput(
            controller: emailController,
            placeholder: 'Email',
            title: 'Email',
          ),
          const SizedBox(height: 20),
          TextInput(
            controller: phoneController,
            placeholder: 'Phone',
            title: 'Phone',
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 20),
          TextInput(
            controller: passwordController,
            placeholder: 'Password',
            title: 'Password',
            isPassword: true,
          ),
          const SizedBox(height: 50),
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
                'Continue',
                style: whiteTextStyle.copyWith(),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
