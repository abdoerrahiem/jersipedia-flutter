import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jersipedia/models/order_history_model.dart';
import 'package:jersipedia/screens/webview_screen.dart';
import 'package:jersipedia/utils/function.dart';
import 'package:jersipedia/utils/theme.dart';
// import 'package:intl/intl.dart';

class HistoryItem extends StatelessWidget {
  final OrderHistoryModel data;

  const HistoryItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 15,
        left: 20,
        right: 20,
      ),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: whiteColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat('EEEE, d MMM yyyy', 'id')
                .format(DateTime.parse(data.createdAt.toString())),
            style: whiteTextStyle.copyWith(
              fontWeight: fontWeightSemiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 15),
          Column(
            children: data.cart!
                .map(
                  (e) => Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1. ',
                          style: whiteTextStyle.copyWith(
                            fontWeight: fontWeightSemiBold,
                          ),
                        ),
                        const SizedBox(width: 5),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            e.jerseyImage.toString(),
                            width: 60,
                            height: 60,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.jerseyTitle.toString(),
                                style: whiteTextStyle.copyWith(
                                  fontWeight: fontWeightSemiBold,
                                ),
                              ),
                              Text(
                                formatRupiah(e.jerseyPrice!),
                                style: whiteTextStyle.copyWith(),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    'Jumlah: ',
                                    style: whiteTextStyle.copyWith(),
                                  ),
                                  Text(
                                    '${e.amount}',
                                    style: whiteTextStyle.copyWith(
                                      fontWeight: fontWeightSemiBold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Total Harga: ',
                                    style: whiteTextStyle.copyWith(),
                                  ),
                                  Text(
                                    formatRupiah(e.total!),
                                    style: whiteTextStyle.copyWith(
                                      fontWeight: fontWeightSemiBold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Status:',
                  style: whiteTextStyle.copyWith(
                    fontWeight: fontWeightSemiBold,
                  ),
                ),
              ),
              Text(
                data.status == 'pending'
                    ? 'Pending'
                    : data.status == 'settlement'
                        ? 'Lunas'
                        : 'Kadaluarsa',
                style: whiteTextStyle.copyWith(
                  fontWeight: fontWeightSemiBold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Ongkir (${data.estimation} hari):',
                  style: whiteTextStyle.copyWith(
                    fontWeight: fontWeightSemiBold,
                  ),
                ),
              ),
              Text(
                formatRupiah(data.ongkir!),
                style: whiteTextStyle.copyWith(
                  fontWeight: fontWeightSemiBold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Total Harga:',
                  style: whiteTextStyle.copyWith(
                    fontWeight: fontWeightSemiBold,
                  ),
                ),
              ),
              Text(
                formatRupiah(data.total!),
                style: whiteTextStyle.copyWith(
                  fontWeight: fontWeightSemiBold,
                ),
              ),
            ],
          ),
          if (data.status == 'pending')
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebviewScreen(
                          title: 'Lanjutkan Pembayaran',
                          uri: data.paymentLink.toString(),
                          fromHistory: true,
                        ),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.payment,
                    color: blueColor,
                    size: 16,
                  ),
                  label: Text(
                    'Lanjutkan pembayaran',
                    style: blueTextStyle.copyWith(fontSize: 14),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(whiteColor),
                    overlayColor: MaterialStateProperty.all<Color>(greyColor),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
