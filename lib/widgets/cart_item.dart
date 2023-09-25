import 'package:flutter/material.dart';
import 'package:jersipedia/utils/function.dart';
import 'package:jersipedia/utils/theme.dart';

class CartItem extends StatelessWidget {
  final String name;
  final num price;
  final String size;
  final num qty;
  final String imageUrl;
  final VoidCallback onDelete;

  const CartItem({
    super.key,
    required this.name,
    required this.price,
    required this.size,
    required this.qty,
    required this.imageUrl,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin:
              const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 15),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: whiteColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  width: 70,
                  height: 70,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: fontWeightSemiBold,
                      ),
                    ),
                    Text(
                      formatRupiah(price),
                      style: whiteTextStyle.copyWith(),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'Amount: ',
                          style: whiteTextStyle.copyWith(),
                        ),
                        Text(
                          '$qty',
                          style: whiteTextStyle.copyWith(
                            fontWeight: fontWeightSemiBold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Size: ',
                          style: whiteTextStyle.copyWith(),
                        ),
                        Text(
                          size,
                          style: whiteTextStyle.copyWith(
                            fontWeight: fontWeightSemiBold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Total Price: ',
                          style: whiteTextStyle.copyWith(),
                        ),
                        Text(
                          formatRupiah(qty * price),
                          style: whiteTextStyle.copyWith(
                            fontWeight: fontWeightSemiBold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 10,
          top: 0,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: redColor,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              onPressed: onDelete,
              icon: const Icon(Icons.close),
              color: whiteColor,
              iconSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
