import 'package:flutter/material.dart';
import 'package:jersipedia/utils/theme.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: fontWeightBlack,
          ),
        ),
        centerTitle: true,
        backgroundColor: blueColor,
        leadingWidth: 90,
        leading: Container(
          margin: const EdgeInsets.only(left: 20, right: 15),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(999),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_left,
              color: blueColor,
              size: 28,
            ),
          ),
        ),
      ),
      body: Container(),
    );
  }
}
