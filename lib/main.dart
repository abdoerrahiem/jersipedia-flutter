import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jersipedia/blocs/user/user_bloc.dart';
import 'package:jersipedia/screens/cart_screen.dart';
import 'package:jersipedia/screens/checkout_screen.dart';
import 'package:jersipedia/screens/history_checkout_screen.dart';
import 'package:jersipedia/screens/home_screen.dart';
import 'package:jersipedia/screens/login_screen.dart';
import 'package:jersipedia/screens/product_detail_screen.dart';
import 'package:jersipedia/screens/register_address.dart';
import 'package:jersipedia/screens/register_screen.dart';
import 'package:jersipedia/screens/splash_screen.dart';
import 'package:jersipedia/screens/update_password_screen.dart';
import 'package:jersipedia/screens/update_profile_screen.dart';
import 'package:jersipedia/utils/function.dart';
import 'package:jersipedia/utils/theme.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: whiteColor,
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            backgroundColor: whiteColor,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(color: blackColor),
            titleTextStyle: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: fontWeightSemiBold,
            ),
          ),
        ),
        routes: {
          '/': (context) => const SplashScreen(),
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/register-address': (context) => const RegisterAddress(),
          '/home': (context) => const HomeScreen(),
          '/product': (context) => const ProductDetailScreen(),
          '/cart': (context) => const CartScreen(),
          '/checkout': (context) => const CheckoutScreen(),
          '/history-checkout': (context) => const HistoryCheckoutScreen(),
          '/change-profile': (context) => const UpdateProfileScreen(),
          '/change-password': (context) => const UpdatePasswordScreen(),
        },
      ),
    );
  }
}
