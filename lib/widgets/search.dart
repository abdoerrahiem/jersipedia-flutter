import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jersipedia/blocs/jersey/jersey_bloc.dart';
import 'package:jersipedia/blocs/league/league_bloc.dart';
import 'package:jersipedia/screens/product_detail_screen.dart';
import 'package:jersipedia/utils/theme.dart';
import 'package:jersipedia/widgets/league_card.dart';
import 'package:jersipedia/widgets/loader.dart';
import 'package:jersipedia/widgets/not_found.dart';
import 'package:jersipedia/widgets/product_card.dart';
import 'package:jersipedia/widgets/text_input.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController(text: '');
    String league = '';
    num page = 1;

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
                      textInputAction: TextInputAction.search,
                      placeholder: 'Cari Jersey...',
                      lelftIcon: const Icon(
                        Icons.search,
                        size: 30,
                      ),
                      onSubmit: (value) {
                        context.read<JerseyBloc>().add(
                              GetJersey(
                                league: league,
                                page: page,
                                size: 10,
                                title: value.toString(),
                              ),
                            );

                        context
                            .read<JerseySearchBloc>()
                            .add(ChangeJerseySearchText(value));
                        context.read<JerseySearchByLeagueBloc>().add(
                              const ChangeJerseySearchByLeague(
                                '',
                                '',
                              ),
                            );
                      },
                    ),
                  ),
                  searchLeague(context),
                ],
              ),
            ),
          ),
          searchResult(context),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

Widget searchLeague(BuildContext context) {
  return Builder(builder: (context) {
    final leagueState = context.watch<LeagueBloc>().state;

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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: leagueState.data
                          .map(
                            (item) => LeagueCard(
                              image: item.image.toString(),
                              onPressed: () {
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
                              },
                            ),
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

Widget searchResult(BuildContext context) {
  return Builder(builder: (context) {
    final jerseyState = context.watch<JerseyBloc>().state;
    final searchState = context.watch<JerseySearchBloc>().state;
    final searchByLeagueState = context.watch<JerseySearchByLeagueBloc>().state;

    return jerseyState is JerseySuccess
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (searchState is JerseySearchText &&
                  searchState.text.isNotEmpty)
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
                        searchState.text,
                        style: blackTextStyle.copyWith(
                          fontWeight: fontWeightBold,
                        ),
                      ),
                    ],
                  ),
                ),
              if (searchByLeagueState is JerseySearchByLeague &&
                  searchByLeagueState.id.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Jersey League: ',
                        style: blackTextStyle.copyWith(),
                      ),
                      Text(
                        searchByLeagueState.name,
                        style: blackTextStyle.copyWith(
                          fontWeight: fontWeightBold,
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: jerseyState.data.isNotEmpty
                    ? Wrap(
                        spacing: 15,
                        runSpacing: 15,
                        children: jerseyState.data
                            .map(
                              (item) => ProductCard(
                                image: item.images![0].toString(),
                                title: item.title.toString(),
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
                      )
                    : NotFound(
                        title:
                            "Ooops!!! jersey ${searchState is JerseySearchText && searchState.text.isNotEmpty ? '"${searchState.text}"' : searchByLeagueState is JerseySearchByLeague && searchByLeagueState.name.isNotEmpty ? '"${searchByLeagueState.name}"' : ''} not found"),
              ),
            ],
          )
        : jerseyState is JerseyLoading
            ? const Loader()
            : const NotFound(title: 'Ooops!!! jersey not found');
  });
}
