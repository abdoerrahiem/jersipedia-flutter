import 'package:flutter/material.dart';
import 'package:jersipedia/utils/function.dart';
import 'package:jersipedia/utils/theme.dart';

class ProductCard extends StatelessWidget {
  final String? title;
  final String? image;
  final num? price;
  final VoidCallback? onPress;

  const ProductCard({
    super.key,
    this.title = 'No Title',
    this.image =
        'https://inspektorat.kaltimprov.go.id/assets/images/no-image-icon.png',
    this.price = 0,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    // void onProduct() {
    //   Navigator.pushNamed(context, '/product');
    // }

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
          Image.network(
            image.toString(),
            fit: BoxFit.contain,
            width: 200,
            height: 100,
          ),
          const SizedBox(height: 5),
          Text(
            title!,
            maxLines: 2,
            style: blackTextStyle.copyWith(
              fontWeight: fontWeightSemiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                formatRupiah(price!),
                style: blueTextStyle.copyWith(
                  fontWeight: fontWeightBold,
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: onPress,
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
