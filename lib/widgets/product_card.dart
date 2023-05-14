import 'package:flutter/material.dart';
import 'package:jersipedia/utils/theme.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.3,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: blueColor,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/images/chelsea.png',
            fit: BoxFit.contain,
            width: 200,
            height: 100,
          ),
          const SizedBox(height: 5),
          Text(
            'Chelsea 3rd',
            style: blackTextStyle.copyWith(
              fontWeight: fontWeightSemiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                'Rp. 50.000',
                style: blueTextStyle.copyWith(
                  fontWeight: fontWeightBold,
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(blueColor),
                  overlayColor:
                      MaterialStateColor.resolveWith((states) => greyColor),
                ),
                child: Text(
                  'Detail',
                  style: whiteTextStyle.copyWith(fontSize: 12),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
