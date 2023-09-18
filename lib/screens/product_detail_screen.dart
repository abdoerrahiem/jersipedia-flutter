import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jersipedia/blocs/cart/cart_bloc.dart';
import 'package:jersipedia/models/add_cart_model.dart';
import 'package:jersipedia/models/jersey_model.dart';
import 'package:jersipedia/utils/function.dart';
import 'package:jersipedia/utils/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:jersipedia/widgets/league_card.dart';
import 'package:jersipedia/widgets/loader.dart';
import 'package:jersipedia/widgets/text_input.dart';

class ProductDetailScreen extends StatefulWidget {
  final JerseyModel product;
  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  List<Map<String, dynamic>> items = [];
  Map<String, dynamic> item = {};
  final TextEditingController descriptionController =
      TextEditingController(text: '');
  num amount = 1;
  String size = '';

  @override
  void initState() {
    super.initState();
    final currentProduct = widget.product;
    setState(() {
      size = currentProduct.size![0];
      items = currentProduct.images!
          .asMap()
          .map((i, element) => MapEntry(i, {
                'id': i + 1,
                'image': element.toString(),
              }))
          .values
          .toList();
      item = {'id': 1, 'image': currentProduct.images![0]};
    });
  }

  onAdd() {
    if (widget.product.stock! >= amount) {
      setState(() {
        amount = amount + 1;
      });
    }
  }

  onMinus() {
    if (amount != 1) {
      setState(() {
        amount = amount - 1;
      });
    }
  }

  onChangeSize(String value) {
    setState(() {
      size = value;
    });
  }

  onAddToCart() {
    context.read<CartBloc>().add(
          AddCart(
            AddCartModel(
              jerseyId: widget.product.id,
              amount: amount,
              size: size,
              description: descriptionController.text,
            ),
          ),
        );
  }

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
            productDetail(
              descriptionController,
              widget.product,
              amount,
              size,
              onAdd,
              onMinus,
              (value) => onChangeSize(value),
              onAddToCart,
            ),
          ],
        ),
      ),
    );
  }
}

Widget productHeader(BuildContext context, List<Map<String, dynamic>> items,
    Map<String, dynamic> item, Function(int) onPageChanged) {
  void onBack() {
    Navigator.pop(context);
  }

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
            onPressed: onBack,
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

Widget productDetail(
  TextEditingController descriptionController,
  JerseyModel product,
  num amount,
  String size,
  Function onAdd,
  Function onMinus,
  Function(String) onChangeSize,
  VoidCallback onAddToCart,
) {
  return BlocListener<CartBloc, CartState>(
    listener: (context, state) {
      if (state is AddCartFailed) {
        showSnackbar(context: context, message: state.e);
      }

      if (state is AddCartSuccess) {
        Navigator.popAndPushNamed(context, '/cart');
        showSnackbar(
          context: context,
          message: state.message,
          type: SnackbarType.success,
        );
      }
    },
    child: Builder(builder: (context) {
      final cartState = context.watch<CartBloc>().state;

      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title.toString(),
                        style: blackTextStyle.copyWith(
                          fontWeight: fontWeightBold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '(${formatRupiah(product.price!)})',
                        style: blackTextStyle.copyWith(
                          fontWeight: fontWeightSemiBold,
                        ),
                      ),
                    ],
                  ),
                ),
                LeagueCard(
                  backgroundColor: whiteColor,
                  borderWidth: 1,
                  borderColor: blueColor,
                  image: product.league!['image'],
                  onPressed: () {},
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
                  'Jenis: ${product.type}',
                  style: blackTextStyle.copyWith(),
                ),
                Text(
                  'Berat: ${product.weight} kg',
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
                            onPressed: () => onMinus(),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            amount.toString(),
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
                            onPressed: () => onAdd(),
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
                          value: size,
                          items: product.size!.map((size) {
                            return DropdownMenuItem(
                              value: size,
                              child: Text(
                                size,
                                style: blackTextStyle.copyWith(),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            onChangeSize(
                              value.toString(),
                            );
                          }),
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
              title: 'Keterangan',
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
                onPressed: onAddToCart,
                icon: Icon(Icons.shopping_cart, color: whiteColor),
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Masukkan Keranjang',
                      style: whiteTextStyle.copyWith(),
                    ),
                    if (cartState is AddCartLoading)
                      Loader(
                        height: 15,
                        width: 15,
                        color: whiteColor,
                      )
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: blueColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
              ),
            )
          ],
        ),
      );
    }),
  );
}
