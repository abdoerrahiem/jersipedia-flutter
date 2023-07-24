import 'package:flutter/material.dart';
import 'package:jersipedia/utils/theme.dart';
import 'package:jersipedia/widgets/league_card.dart';
import 'package:jersipedia/widgets/product_card.dart';
import 'package:jersipedia/widgets/text_input.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController(text: '');

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 60, child: Container(color: blueColor)),
          Container(
            color: whiteColor,
            child: Container(
              color: blueColor,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    child: TextInput(
                      controller: searchController,
                      placeholder: 'Cari Jersey...',
                      lelftIcon: const Icon(
                        Icons.search,
                        size: 30,
                      ),
                    ),
                  ),
                  searchLeague(context),
                ],
              ),
            ),
          ),
          searchResult(),
        ],
      ),
    );
  }
}

Widget searchLeague(BuildContext context) {
  return Container(
    color: whiteColor,
    padding: const EdgeInsets.only(bottom: 20),
    child: Container(
      padding: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: blueColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                1,
                2,
                3,
                4,
                5,
                6,
                7,
                8,
              ]
                  .map(
                    (item) => LeagueCard(
                      onPressed: () {},
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget searchResult() {
  return Container(
    padding: const EdgeInsets.only(bottom: 20),
    constraints: const BoxConstraints(
      minHeight: 500,
      maxHeight: double.infinity,
    ),
    color: whiteColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Row(
            children: [
              Text(
                'Hasil Pencarian ',
                style: blackTextStyle.copyWith(),
              ),
              Text(
                'Chelsea',
                style: blackTextStyle.copyWith(
                  fontWeight: fontWeightBold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.center,
          child: Wrap(
            spacing: 15,
            runSpacing: 15,
            children: [1, 2, 3, 4, 5]
                .map(
                  (e) => const ProductCard(),
                )
                .toList(),
          ),
        ),
      ],
    ),
  );
}
