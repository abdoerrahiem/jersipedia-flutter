import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jersipedia/blocs/jersey/jersey_bloc.dart';
import 'package:jersipedia/blocs/league/league_bloc.dart';
import 'package:jersipedia/blocs/user/user_bloc.dart';
import 'package:jersipedia/screens/product_detail_screen.dart';
import 'package:jersipedia/utils/theme.dart';
import 'package:jersipedia/widgets/button_icon.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:jersipedia/widgets/league_card.dart';
import 'package:jersipedia/widgets/loader.dart';
import 'package:jersipedia/widgets/product_card.dart';

class Home extends StatefulWidget {
  final Function(int) setIndex;

  const Home({super.key, required this.setIndex});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeSliderIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 50, child: Container(color: blueColor)),
          homeHeader(activeSliderIndex, (value) {
            setState(() {
              activeSliderIndex = value + 1;
            });
          }, context),
          homeLeague(context, widget.setIndex),
          homeProducts(context),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

Widget homeHeader(
    int activeSliderIndex, Function(int) handleSlide, BuildContext context) {
  void onCart() {
    Navigator.pushNamed(context, '/cart');
  }

  void onProduct() {
    Navigator.pushNamed(context, '/product');
  }

  return Builder(builder: (context) {
    final userState = context.watch<UserBloc>().state;

    return Container(
      color: blueColor,
      child: Column(
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
                      userState is CurrentUserSuccess
                          ? userState.user.name.toString()
                          : '',
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
                  handlePress: onCart,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          CarouselSlider(
            options: CarouselOptions(
                height: 120,
                onPageChanged: (index, reason) {
                  handleSlide(index);
                }),
            items: [1, 2, 3].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: onProduct,
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        'assets/images/image_slider.png',
                        fit: BoxFit.contain,
                      ),
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
      ),
    );
  });
}

Widget homeLeague(BuildContext context, Function(int) setIndex) {
  final leagueState = context.watch<LeagueBloc>().state;

  return Builder(builder: (context) {
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
        child: leagueState is LeagueSuccess
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                          'Pilih ',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: fontWeightBold,
                          ),
                        ),
                        Text(
                          'Liga',
                          style: whiteTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: fontWeightBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: leagueState.data
                          .map(
                            (item) => LeagueCard(
                                image: item.image.toString(),
                                onPressed: () {
                                  setIndex(1);
                                  context.read<JerseyBloc>().add(
                                        GetJersey(
                                          league: item.id.toString(),
                                          page: 1,
                                          size: 10,
                                          title: '',
                                        ),
                                      );
                                  context.read<JerseySearchByLeagueBloc>().add(
                                        ChangeJerseySearchByLeague(
                                          item.id.toString(),
                                          item.title.toString(),
                                        ),
                                      );
                                  context.read<JerseySearchBloc>().add(
                                        const ChangeJerseySearchText(''),
                                      );
                                }),
                          )
                          .toList(),
                    ),
                  ),
                ],
              )
            : Container(),
      ),
    );
  });
}

Widget homeProducts(BuildContext context) {
  return Builder(builder: (context) {
    final jerseyHomeState = context.watch<JerseyHomeBloc>().state;

    return Container(
      color: whiteColor,
      child: jerseyHomeState is HomeJerseySuccess
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        'Pilih ',
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: fontWeightBold,
                        ),
                      ),
                      Text(
                        'Jersey ',
                        style: blueTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: fontWeightBold,
                        ),
                      ),
                      Text(
                        'yang kamu inginkan',
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: fontWeightBold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    bottom: 30,
                  ),
                  child: Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    children: jerseyHomeState.data
                        .map(
                          (item) => ProductCard(
                            title: item.title.toString(),
                            image: item.images![0].toString(),
                            price: item.price,
                            onPress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailScreen(
                                    product: item,
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            )
          : const Loader(),
    );
  });
}
