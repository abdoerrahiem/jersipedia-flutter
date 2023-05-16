import 'package:flutter/material.dart';
import 'package:jersipedia/utils/theme.dart';

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final Icon? lelftIcon;
  final double? borderRadius;
  final double? borderWidth;

  const TextInput({
    super.key,
    required this.controller,
    required this.placeholder,
    this.lelftIcon,
    this.borderRadius,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: blackTextStyle.copyWith(
        fontSize: 14,
      ),
      decoration: InputDecoration(
        hintText: placeholder,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        filled: true,
        fillColor: whiteColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: borderWidth ?? 0,
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 999),
        ),
        prefixIcon: lelftIcon != null
            ? Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 10,
                ),
                child: lelftIcon,
              )
            : null,
        prefixIconColor: greyColor,
      ),
    );
  }
}
