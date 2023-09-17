import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jersipedia/blocs/user/user_bloc.dart';
import 'package:jersipedia/models/login_model.dart';
import 'package:jersipedia/utils/function.dart';
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
    final TextEditingController passwordController =
        TextEditingController(text: '');

    void onLogin() {
      if (emailController.text.trim().isEmpty ||
          passwordController.text.trim().isEmpty) {
        return showSnackbar(
            context: context, message: 'Input your email and password.');
      }

      context.read<UserBloc>().add(UserLogin(LoginModel(
          email: emailController.text, password: passwordController.text)));
    }

    void onRegister() {
      Navigator.pushNamed(context, '/register');
    }

    return Scaffold(
        backgroundColor: blueColor,
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            if (state is UserFailed) {
              showSnackbar(context: context, message: state.e);
            }

            if (state is UserSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false);
            }
          },
          builder: (context, state) {
            return Stack(
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
                    const SizedBox(height: 40),
                    TextInput(
                      controller: emailController,
                      placeholder: 'Input your email',
                      title: 'Email',
                    ),
                    const SizedBox(height: 20),
                    TextInput(
                      controller: passwordController,
                      placeholder: 'Input your password',
                      title: 'Password',
                      isPassword: true,
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: onLogin,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Login',
                              style: whiteTextStyle.copyWith(),
                            ),
                            if (state is UserLoading)
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                width: 10,
                                height: 10,
                                child: CircularProgressIndicator(
                                  color: whiteColor,
                                  strokeWidth: 2,
                                ),
                              ),
                          ],
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
                        onPressed: onRegister,
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
                  ),
                ),
              ],
            );
          },
        ));
  }
}
