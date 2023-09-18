import 'package:flutter/material.dart';
import 'package:jersipedia/utils/theme.dart';

class NotFound extends StatelessWidget {
  final String title;
  const NotFound({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/box.png',
            width: 180,
            height: 180,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: redTextStyle.copyWith(),
          ),
        ],
      ),
    );
  }
}
