import 'package:flutter/material.dart';
import 'package:jersipedia/utils/theme.dart';

class LeagueCard extends StatelessWidget {
  const LeagueCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(10)),
      child: IconButton(
        onPressed: () {},
        icon: Image.asset(
          'assets/images/laliga.png',
          height: MediaQuery.of(context).size.width / 6,
          width: MediaQuery.of(context).size.width / 6,
        ),
      ),
    );
  }
}
