import 'package:flutter/material.dart';
import 'package:jersipedia/utils/theme.dart';

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final Icon? lelftIcon;
  final double? borderRadius;
  final double? borderWidth;
  final String title;
  final TextStyle? titleStyle;
  final bool isPassword;
  final TextInputType? keyboardType;
  final bool isMultipleLine;
  final int minLine;
  final Color? borderColor;
  final Color? backgroundColor;

  const TextInput(
      {super.key,
      required this.controller,
      required this.placeholder,
      this.lelftIcon,
      this.borderRadius,
      this.borderWidth,
      this.title = '',
      this.titleStyle,
      this.isPassword = false,
      this.keyboardType,
      this.isMultipleLine = false,
      this.minLine = 1,
      this.borderColor,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Text(
              title,
              style: whiteTextStyle
                  .copyWith(
                    color: whiteColor,
                  )
                  .merge(titleStyle),
            ),
          ),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType ?? TextInputType.none,
          maxLines: isMultipleLine ? null : 1,
          minLines: minLine,
          obscureText: isPassword,
          style: blackTextStyle.copyWith(
            fontSize: 14,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: borderWidth ?? 0,
                color: borderColor ?? whiteColor,
              ),
              borderRadius: BorderRadius.circular(borderRadius ?? 999),
            ),
            hintText: placeholder,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            filled: true,
            fillColor: backgroundColor ?? whiteColor,
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
        ),
      ],
    );
  }
}
