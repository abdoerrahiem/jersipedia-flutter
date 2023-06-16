import 'package:flutter/material.dart';
import 'package:jersipedia/utils/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:jersipedia/widgets/league_card.dart';
import 'package:jersipedia/widgets/text_input.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final List<Map<String, dynamic>> items = [
    {
      'id': 1,
      'image':
          'https://plus.unsplash.com/premium_photo-1669748157807-30514e416843?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
    },
    {
      'id': 2,
      'image':
          'https://plus.unsplash.com/premium_photo-1669741908308-5ca216f3fcd1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8cGVyc29ufGVufDB8fDB8fHww&auto=format&fit=crop&w=400&q=60',
    }
  ];
  Map<String, dynamic> item = {
    'id': 1,
    'image':
        'https://plus.unsplash.com/premium_photo-1669748157807-30514e416843?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
  };
  final TextEditingController descriptionController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            productHeader(context, items, item, (value) {
              setState(() {
                item = items[value];
              });
            }),
            productDetail(descriptionController),
          ],
        ),
      ),
    );
  }
}

Widget productHeader(BuildContext context, List<Map<String, dynamic>> items,
    Map<String, dynamic> item, Function(int) onPageChanged) {
  return Stack(
    children: [
      Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: blueColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.only(
          top: 60,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: false,
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
                height: 220,
                onPageChanged: (value, reason) {
                  onPageChanged(value);
                },
              ),
              items: items.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image.network(
                      item['image'],
                      fit: BoxFit.cover,
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Text(
              '${item['id']}/${items.length}',
              style: whiteTextStyle.copyWith(
                fontWeight: fontWeightSemiBold,
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: 50,
        left: 20,
        child: Container(
          decoration: BoxDecoration(
            color: whiteColor,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {},
            padding: const EdgeInsets.all(7),
            icon: Icon(
              Icons.chevron_left,
              color: blackColor,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget productDetail(TextEditingController descriptionController) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chelsea 3rd 2018-2019',
                  style: blackTextStyle.copyWith(
                    fontWeight: fontWeightBold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '(Rp. 50.000)',
                  style: blackTextStyle.copyWith(
                    fontWeight: fontWeightSemiBold,
                  ),
                ),
              ],
            ),
            LeagueCard(
              backgroundColor: whiteColor,
              borderWidth: 1,
              borderColor: blueColor,
            ),
          ],
        ),
        Divider(
          color: greyColor,
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Jenis: Replika Top Quality',
              style: blackTextStyle.copyWith(),
            ),
            Text(
              'Berat: 0.25 kg',
              style: blackTextStyle.copyWith(),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jumlah',
                  style: blackTextStyle.copyWith(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: greyColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: blackColor,
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        '1',
                        style: blackTextStyle.copyWith(
                            fontWeight: fontWeightBlack, fontSize: 18),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.add,
                          color: blackColor,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ukuran',
                  style: blackTextStyle.copyWith(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: greyColor,
                  ),
                  width: 150,
                  child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      icon: Icon(Icons.expand_more, color: blackColor),
                      value: '1',
                      items: [
                        DropdownMenuItem(
                          value: '1',
                          child: Text(
                            'M',
                            style: blackTextStyle.copyWith(),
                          ),
                        ),
                        DropdownMenuItem(
                          value: '2',
                          child: Text(
                            'L',
                            style: blackTextStyle.copyWith(),
                          ),
                        ),
                        DropdownMenuItem(
                          value: '3',
                          child: Text(
                            'XL',
                            style: blackTextStyle.copyWith(),
                          ),
                        ),
                      ],
                      onChanged: (value) {}),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        TextInput(
          controller: descriptionController,
          placeholder: '',
          title: 'Address',
          titleStyle: blackTextStyle.copyWith(),
          isMultipleLine: true,
          minLine: 5,
          borderRadius: 20,
          backgroundColor: greyColor,
        ),
        const SizedBox(
          height: 30,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart, color: whiteColor),
            label: Text('Masukkan Keranjang', style: whiteTextStyle.copyWith()),
            style: ElevatedButton.styleFrom(
              backgroundColor: blueColor,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
          ),
        )
      ],
    ),
  );
}
