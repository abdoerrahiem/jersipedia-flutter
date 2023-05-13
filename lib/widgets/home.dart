import 'package:flutter/material.dart';
import 'package:jersipedia/utils/theme.dart';
import 'package:jersipedia/widgets/button_icon.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeSliderIndex = 1;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang,',
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2.5),
                  Text(
                    'Abdur Rahim',
                    style: whiteTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              ButtonIcon(
                iconName: 'assets/icons/cart.png',
                chipNumber: 100,
                handlePress: () {},
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        CarouselSlider(
          options: CarouselOptions(
              height: 120,
              initialPage: 0,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() {
                  activeSliderIndex = index + 1;
                });
              }),
          items: [1, 2, 3].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Image.asset(
                    'assets/images/image_slider.png',
                    fit: BoxFit.contain,
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [1, 2, 3]
              .map(
                (e) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: 5,
                  width: e == activeSliderIndex ? 30 : 5,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
