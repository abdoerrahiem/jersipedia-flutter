import 'package:flutter/material.dart';
import 'package:jersipedia/utils/theme.dart';
import 'package:jersipedia/widgets/home.dart';
import 'package:jersipedia/widgets/profile.dart';
import 'package:jersipedia/widgets/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = const <Widget>[
    Home(),
    Search(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: whiteColor,
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: BottomNavigationBar(
          backgroundColor: blueColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.house_outlined,
                color: greyColor,
                size: 35,
              ),
              label: '',
              activeIcon: Icon(
                Icons.house,
                color: whiteColor,
                size: 35,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search_outlined,
                color: greyColor,
                size: 35,
              ),
              label: '',
              activeIcon: Icon(
                Icons.search,
                color: whiteColor,
                size: 35,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                color: greyColor,
                size: 35,
              ),
              label: '',
              activeIcon: Icon(
                Icons.account_circle,
                color: whiteColor,
                size: 35,
              ),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
