import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jersipedia/blocs/cart/cart_bloc.dart';
import 'package:jersipedia/blocs/city/city_bloc.dart';
import 'package:jersipedia/blocs/jersey/jersey_bloc.dart';
import 'package:jersipedia/blocs/league/league_bloc.dart';
import 'package:jersipedia/blocs/province/province_bloc.dart';
import 'package:jersipedia/blocs/user/user_bloc.dart';
import 'package:jersipedia/screens/cart_screen.dart';
import 'package:jersipedia/screens/checkout_screen.dart';
import 'package:jersipedia/screens/history_checkout_screen.dart';
import 'package:jersipedia/screens/home_screen.dart';
import 'package:jersipedia/screens/login_screen.dart';
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
        BlocProvider(create: (context) => ProvinceBloc()),
        BlocProvider(create: (context) => CityBloc()),
        BlocProvider(create: (context) => LeagueBloc()),
        BlocProvider(create: (context) => JerseyBloc()),
        BlocProvider(create: (context) => JerseyHomeBloc()),
        BlocProvider(create: (context) => JerseySearchBloc()),
        BlocProvider(create: (context) => JerseySearchByLeagueBloc()),
        BlocProvider(create: (context) => CartBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: whiteColor,
          useMaterial3: true,
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          }),
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
          '/home': (context) => const HomeScreen(),
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
