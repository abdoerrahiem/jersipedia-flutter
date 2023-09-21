import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jersipedia/blocs/cart/cart_bloc.dart';
import 'package:jersipedia/models/cart_model.dart';
import 'package:jersipedia/screens/checkout_screen.dart';
import 'package:jersipedia/utils/function.dart';
import 'package:jersipedia/utils/theme.dart';
import 'package:jersipedia/widgets/cart_item.dart';
import 'package:jersipedia/widgets/loader.dart';
import 'package:jersipedia/widgets/not_found.dart';
import 'package:focus_detector_v2/focus_detector_v2.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  num total = 0;
  List<CartModel> data = [];
  String currentId = '';

  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(GetMyCart());
  }

  onBack() {
    Navigator.pop(context);
    context.read<CartBloc>().add(GetMyCart());
  }

  onCheckout() {
    num weight = 0;
    List<String> cart = [];

    for (CartModel e in data) {
      weight = weight + (e.jersey!['weight'] * e.amount);
      cart = [...cart, e.id.toString()];
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CheckoutScreen(
          cart: cart,
          total: total,
          weight: weight,
        ),
      ),
    );
  }

  onDelete(String id) {
    currentId = id;
    context.read<CartBloc>().add(RemoveMyCart(id));
  }

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusGained: () {
        setState(() {
          data = [];
        });
        context.read<CartBloc>().add(GetMyCart());
      },
      child: WillPopScope(
          child: Scaffold(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0),
                      icon: const Icon(Icons.chevron_left),
                      color: blueColor,
                      iconSize: 30,
                      onPressed: onBack,
                    ),
                  ),
                ],
              ),
            ),
            body: BlocConsumer<CartBloc, CartState>(
              listener: (context, state) {
                if (state is GetMyCartSuccess && state.data.isNotEmpty) {
                  num currentTotal = 0;
                  for (CartModel e in state.data) {
                    currentTotal = currentTotal + e.total!;
                  }
                  setState(() {
                    data = state.data;
                    total = currentTotal;
                  });
                }

                if (state is RemoveMyCartFailed) {
                  showSnackbar(context: context, message: state.e);
                }

                if (state is RemoveMyCartSuccess) {
                  showSnackbar(
                    context: context,
                    message: state.message,
                    type: SnackbarType.success,
                  );

                  List<CartModel> currentData =
                      data.where((e) => e.id != currentId).toList();
                  num currentTotal = 0;

                  for (CartModel e in currentData) {
                    currentTotal = currentTotal + e.total!;
                  }
                  setState(() {
                    data = currentData;
                    total = currentTotal;
                  });
                }
              },
              builder: (context, state) {
                return state is GetMyCartLoading
                    ? Center(
                        child: Loader(color: whiteColor),
                      )
                    : data.isNotEmpty
                        ? Stack(
                            children: [
                              ListView(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 100,
                                ),
                                children: data.map((item) {
                                  return CartItem(
                                    name: item.jersey!['title'],
                                    price: item.jersey!['price'],
                                    size: item.size.toString(),
                                    qty: item.amount!,
                                    imageUrl: item.jersey!['images'][0],
                                    onDelete: () =>
                                        onDelete(item.id.toString()),
                                  );
                                }).toList(),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Total Harga:',
                                            style: greyTextStyle.copyWith(
                                                fontSize: 16),
                                          ),
                                          Text(
                                            formatRupiah(total),
                                            style: blackTextStyle.copyWith(
                                              fontSize: 20,
                                              fontWeight: fontWeightBold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      TextButton.icon(
                                        onPressed: onCheckout,
                                        icon: Icon(
                                          Icons.shopping_cart,
                                          color: whiteColor,
                                        ),
                                        label: Text('Checkout',
                                            style: whiteTextStyle.copyWith(
                                                fontSize: 16)),
                                        style: ButtonStyle(
                                          padding: MaterialStateProperty.all<
                                                  EdgeInsets>(
                                              const EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 10,
                                          )),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  blueColor),
                                          overlayColor:
                                              MaterialStateProperty.all<Color>(
                                                  greyColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const NotFound(title: "You don't have any cart yet.");
              },
            ),
          ),
          onWillPop: () async {
            context.read<CartBloc>().add(GetMyCart());
            return true;
          }),
    );
  }
}
