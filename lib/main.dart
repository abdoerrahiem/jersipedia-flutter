import 'package:flutter/material.dart';
import 'package:jersipedia/screens/home_screen.dart';
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
        scaffoldBackgroundColor: blueColor,
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
        '/': (context) => const HomeScreen(),
      },
    );
  }
}
