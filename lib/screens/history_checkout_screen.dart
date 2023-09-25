import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jersipedia/blocs/order/order_bloc.dart';
import 'package:jersipedia/utils/theme.dart';
import 'package:jersipedia/widgets/history_item.dart';
import 'package:jersipedia/widgets/loader.dart';
import 'package:jersipedia/widgets/not_found.dart';

class HistoryCheckoutScreen extends StatefulWidget {
  const HistoryCheckoutScreen({super.key});

  @override
  State<HistoryCheckoutScreen> createState() => _HistoryCheckoutScreenState();
}

class _HistoryCheckoutScreenState extends State<HistoryCheckoutScreen> {
  @override
  void initState() {
    super.initState();
    context.read<OrderBloc>().add(GetOrders());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      appBar: AppBar(
        title: Text(
          'Checkout Histories',
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
      body: BlocConsumer<OrderBloc, OrderState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state is GetOrdersLoading
              ? Center(
                  child: Loader(
                    color: whiteColor,
                  ),
                )
              : state is GetOrdersSuccess && state.data.isNotEmpty
                  ? ListView(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      children: state.data
                          .map(
                            (item) => HistoryItem(
                              data: item,
                            ),
                          )
                          .toList(),
                    )
                  : const NotFound(title: 'Your history checkout is empty.');
        },
      ),
    );
  }
}
