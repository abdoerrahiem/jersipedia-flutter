import 'package:flutter/material.dart';
import 'package:jersipedia/utils/theme.dart';

class LeagueCard extends StatelessWidget {
  final Color? backgroundColor;
  final double? borderWidth;
  final Color? borderColor;
  final VoidCallback onPressed;
  final String image;

  const LeagueCard({
    super.key,
    this.backgroundColor,
    this.borderWidth,
    this.borderColor,
    required this.onPressed,
    this.image = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        color: backgroundColor ?? whiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: borderWidth ?? 0,
        ),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: image.isNotEmpty
            ? Image.network(
                image,
                height: MediaQuery.of(context).size.width / 6,
                width: MediaQuery.of(context).size.width / 6,
              )
            : Image.asset(
                'assets/images/laliga.png',
                height: MediaQuery.of(context).size.width / 6,
                width: MediaQuery.of(context).size.width / 6,
              ),
      ),
    );
  }
}
