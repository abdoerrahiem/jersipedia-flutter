import 'package:flutter/material.dart';
import 'package:jersipedia/utils/theme.dart';
import 'package:jersipedia/widgets/history_item.dart';

class HistoryCheckoutScreen extends StatelessWidget {
  const HistoryCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      appBar: AppBar(
        title: Text(
          'History Checkout',
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
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        children: [
          HistoryItem(
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
    );
  }
}
