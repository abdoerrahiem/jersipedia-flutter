import 'package:flutter/material.dart';
import 'package:jersipedia/screens/cart_screen.dart';
import 'package:jersipedia/screens/checkout_screen.dart';
import 'package:jersipedia/screens/history_checkout_screen.dart';
import 'package:jersipedia/screens/home_screen.dart';
import 'package:jersipedia/screens/login_screen.dart';
import 'package:jersipedia/screens/product_detail_screen.dart';
import 'package:jersipedia/screens/register_address.dart';
import 'package:jersipedia/screens/register_screen.dart';
import 'package:jersipedia/screens/update_password_screen.dart';
import 'package:jersipedia/screens/update_profile_screen.dart';
import 'package:jersipedia/screens/webview_screen.dart';
import 'package:jersipedia/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        '/': (context) => const HistoryCheckoutScreen(),
      },
    );
  }
}
