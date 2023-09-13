import 'package:flutter/material.dart';
import 'package:jersipedia/models/register_model.dart';
import 'package:jersipedia/screens/register_address.dart';
import 'package:jersipedia/utils/function.dart';
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

    void onContinue() {
      if (nameController.text.trim().isEmpty ||
          emailController.text.trim().isEmpty ||
          phoneController.text.trim().isEmpty ||
          passwordController.text.trim().isEmpty) {
        return showSnackbar(
            context: context, message: 'All fields are required.');
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterAddress(
            data: RegisterModel(
                name: nameController.text,
                email: emailController.text,
                phone: phoneController.text,
                password: passwordController.text),
          ),
        ),
      );
    }

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
              onPressed: onContinue,
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
