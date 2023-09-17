import 'package:flutter/material.dart';
import 'package:jersipedia/utils/theme.dart';

class Loader extends StatelessWidget {
  final double width;
  final double height;
  final Color? color;

  const Loader({
    super.key,
    this.width = 50,
    this.height = 50,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5),
      width: width,
      height: height,
      child: CircularProgressIndicator(
        color: color ?? blueColor,
        strokeWidth: 2,
      ),
    );
  }
}
