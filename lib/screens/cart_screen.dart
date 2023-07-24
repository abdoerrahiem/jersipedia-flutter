import 'package:flutter/material.dart';
import 'package:jersipedia/utils/theme.dart';
import 'package:jersipedia/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onBack() {
      Navigator.pop(context);
    }

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
        leading: Row(
          children: [
            const SizedBox(width: 20),
            Container(
              decoration: BoxDecoration(
                color: whiteColor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                icon: const Icon(Icons.chevron_left),
                color: blueColor,
                iconSize: 30,
                onPressed: onBack,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ),
            children: [
              CartItem(
                name: 'Real Madrid 3rd 2023/2024',
                price: 50000,
                size: 'XL',
                qty: 2,
                imageUrl:
                    'https://images.unsplash.com/photo-1635710064268-69aa5d9355c1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHJlYWwlMjBtYWRyaWR8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=400&q=60',
                onDelete: () {},
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Harga:',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                        Text(
                          'Rp. 400.000',
                          style: blackTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: fontWeightBold,
                          ),
                        ),
                      ],
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart,
                        color: whiteColor,
                      ),
                      label: Text('Checkout',
                          style: whiteTextStyle.copyWith(fontSize: 16)),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        )),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(blueColor),
                        overlayColor:
                            MaterialStateProperty.all<Color>(greyColor),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
