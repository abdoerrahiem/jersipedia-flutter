import 'package:flutter/material.dart';
import 'package:jersipedia/utils/theme.dart';

class ProfileButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPress;

  const ProfileButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      highlightColor: greyColor,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  icon,
                  color: blueColor,
                  size: 32,
                ),
                const SizedBox(width: 15),
                Text(
                  title,
                  style: blueTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: fontWeightBold,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.chevron_right,
                  color: blueColor,
                  size: 32,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              color: blueColor,
              width: MediaQuery.of(context).size.width - 80,
              height: 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
