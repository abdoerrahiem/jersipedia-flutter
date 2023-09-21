import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jersipedia/blocs/order/order_bloc.dart';
import 'package:jersipedia/blocs/user/user_bloc.dart';
import 'package:jersipedia/models/add_order_model.dart';
import 'package:jersipedia/models/check_ongkir_model.dart';
import 'package:jersipedia/screens/webview_screen.dart';
import 'package:jersipedia/utils/function.dart';
import 'package:jersipedia/utils/theme.dart';
import 'package:jersipedia/widgets/loader.dart';

class CheckoutScreen extends StatefulWidget {
  final num weight;
  final num total;
  final List<String> cart;

  const CheckoutScreen({
    super.key,
    required this.weight,
    required this.total,
    required this.cart,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String courier = 'jne';
  num allTotal = 0;

  @override
  void initState() {
    super.initState();
    context.read<OrderBloc>().add(
          CheckOngkir(
            CheckOngkirModel(
              courier: courier,
              weight: widget.weight * 1000,
            ),
          ),
        );

    setState(() {
      allTotal = widget.total;
    });
  }

  onPay() {
    final orderState = context.read<OrderBloc>().state;
    final userState = context.read<UserBloc>().state;
    final addOrderState = context.read<AddOrderBloc>().state;

    if (orderState is CheckOngkirLoading ||
        userState is CurrentUserLoading ||
        addOrderState is AddOrderLoading) {
      return;
    }

    if (orderState is CheckOngkirSuccess) {
      context.read<AddOrderBloc>().add(
            AddOrder(
              AddOrderModel(
                cart: widget.cart,
                estimation: orderState.data.etd,
                ongkir: orderState.data.value,
                total: allTotal,
                courier: courier,
              ),
            ),
          );
    }
  }

  onChangeAddress() {
    Navigator.pushNamed(context, '/change-profile');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      appBar: AppBar(
        title: Text(
          'Checkout',
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
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<OrderBloc, OrderState>(listener: (context, state) {
            if (state is CheckOngkirFailed) {
              showSnackbar(context: context, message: state.e);
            }

            if (state is CheckOngkirSuccess) {
              setState(() {
                allTotal = widget.total + state.data.value!;
              });
            }
          }),
          BlocListener<AddOrderBloc, OrderState>(listener: (context, state) {
            if (state is AddOrderFailed) {
              showSnackbar(context: context, message: state.e);
            }

            if (state is AddOrderSuccess) {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebviewScreen(
                    title: 'Lanjutkan Pembayaran',
                    uri: state.data.toString(),
                  ),
                ),
              );
            }
          })
        ],
        child: Builder(builder: (context) {
          final orderState = context.watch<OrderBloc>().state;
          final userState = context.watch<UserBloc>().state;
          final addOrderState = context.watch<AddOrderBloc>().state;

          return Stack(
            children: [
              ListView(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                children: [
                  const SizedBox(height: 25),
                  Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: whiteColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Alamat: ',
                          style: whiteTextStyle.copyWith(
                            fontWeight: fontWeightSemiBold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          userState is CurrentUserSuccess
                              ? userState.user.address.toString()
                              : '',
                          style: whiteTextStyle.copyWith(),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: onChangeAddress,
                            style: TextButton.styleFrom(
                              foregroundColor: whiteColor,
                              backgroundColor: Colors.transparent,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(999),
                                side: BorderSide(color: whiteColor, width: 1),
                              ),
                            ),
                            child: Text(
                              'Ubah Alamat',
                              style: whiteTextStyle.copyWith(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Jumlah Harga: ',
                                style: whiteTextStyle.copyWith(
                                  fontWeight: fontWeightSemiBold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                              formatRupiah(widget.total),
                              style: whiteTextStyle.copyWith(
                                fontWeight: fontWeightSemiBold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Text(
                          'Pilih Ekspedisi: ',
                          style: whiteTextStyle.copyWith(
                            fontWeight: fontWeightSemiBold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: whiteColor,
                          ),
                          child: DropdownButtonFormField(
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              icon: Icon(Icons.expand_more, color: blackColor),
                              value: courier,
                              items: [
                                DropdownMenuItem(
                                  value: 'jne',
                                  child: Text(
                                    'JNE',
                                    style: blackTextStyle.copyWith(),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'tiki',
                                  child: Text(
                                    'TIKI',
                                    style: blackTextStyle.copyWith(),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'pos',
                                  child: Text(
                                    'Kantor Pos',
                                    style: blackTextStyle.copyWith(),
                                  ),
                                ),
                              ],
                              onChanged: (value) {
                                context.read<OrderBloc>().add(
                                      CheckOngkir(
                                        CheckOngkirModel(
                                          courier: value,
                                          weight: widget.weight * 1000,
                                        ),
                                      ),
                                    );
                                setState(() {
                                  courier = value!;
                                });
                              }),
                        ),
                        const SizedBox(height: 25),
                        if (orderState is CheckOngkirLoading)
                          Center(child: Loader(color: whiteColor)),
                        if (orderState is CheckOngkirSuccess)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Biaya Ongkir: ',
                                style: whiteTextStyle.copyWith(
                                  fontWeight: fontWeightSemiBold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Berat ${widget.weight} kg',
                                      style: whiteTextStyle.copyWith(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    formatRupiah(orderState.data.value!),
                                    style: whiteTextStyle.copyWith(
                                      fontWeight: fontWeightSemiBold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Estimasi Waktu',
                                      style: whiteTextStyle.copyWith(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${orderState.data.etd!.replaceAll('HARI', '')} hari',
                                    style: whiteTextStyle.copyWith(
                                      fontWeight: fontWeightSemiBold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                      ],
                    ),
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
                              formatRupiah(allTotal),
                              style: blackTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: fontWeightBold,
                              ),
                            ),
                          ],
                        ),
                        TextButton.icon(
                          onPressed: onPay,
                          icon: Icon(
                            Icons.shopping_cart,
                            color: whiteColor,
                          ),
                          label: Row(
                            children: [
                              Text(
                                'Bayar',
                                style: whiteTextStyle.copyWith(fontSize: 16),
                              ),
                              if (addOrderState is AddOrderLoading)
                                Loader(
                                  width: 15,
                                  height: 15,
                                  color: whiteColor,
                                ),
                            ],
                          ),
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
          );
        }),
      ),
    );
  }
}
