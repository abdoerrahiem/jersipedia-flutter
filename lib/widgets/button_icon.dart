import 'package:flutter/material.dart';
import 'package:jersipedia/utils/theme.dart';

class ButtonIcon extends StatelessWidget {
  final String iconName;
  final VoidCallback handlePress;
  final double? iconHeight;
  final double? iconWidth;
  final double? imageHeight;
  final double? imageWidth;
  final Color? hightlightColor;
  final num? chipNumber;

  const ButtonIcon({
    super.key,
    required this.iconName,
    required this.handlePress,
    this.iconHeight,
    this.iconWidth,
    this.imageHeight,
    this.imageWidth,
    this.hightlightColor,
    this.chipNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: iconHeight ?? 45,
      width: iconWidth ?? 45,
      decoration: ShapeDecoration(
        color: whiteColor,
        shape: const CircleBorder(),
      ),
      child: Stack(
        children: [
          IconButton(
            icon: Image.asset(
              iconName,
              height: imageHeight ?? 20,
              width: imageWidth ?? 20,
            ),
            highlightColor: hightlightColor ?? greyColor,
            onPressed: handlePress,
          ),
          if (chipNumber != null)
            Positioned(
              top: 5,
              right: 5,
              child: Container(
                height: 20,
                width: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  '${chipNumber! > 99 ? "99+" : chipNumber}',
                  style: whiteTextStyle.copyWith(
                    fontSize: 8,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
