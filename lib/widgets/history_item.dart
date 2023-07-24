import 'package:flutter/material.dart';
import 'package:jersipedia/utils/function.dart';
import 'package:jersipedia/utils/theme.dart';

class HistoryItem extends StatelessWidget {
  final String name;
  final num price;
  final String size;
  final num qty;
  final String imageUrl;
  final VoidCallback onDelete;

  const HistoryItem({
    super.key,
    required this.name,
    required this.price,
    required this.size,
    required this.qty,
    required this.imageUrl,
    required this.onDelete,
  });

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
            'Senin, 24 Juli 2023',
            style: whiteTextStyle.copyWith(
              fontWeight: fontWeightSemiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 15),
          Column(
            children: [1, 2, 3]
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
                            imageUrl,
                            width: 60,
                            height: 60,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: whiteTextStyle.copyWith(
                                fontWeight: fontWeightSemiBold,
                              ),
                            ),
                            Text(
                              formatRupiah(price),
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
                                  '$qty',
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
                                  formatRupiah(qty * price),
                                  style: whiteTextStyle.copyWith(
                                    fontWeight: fontWeightSemiBold,
                                  ),
                                ),
                              ],
                            ),
                          ],
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
                'Lunas',
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
                  'Ongkir (2-3 hari):',
                  style: whiteTextStyle.copyWith(
                    fontWeight: fontWeightSemiBold,
                  ),
                ),
              ),
              Text(
                'Rp 15.000',
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
                'Rp 215.000',
                style: whiteTextStyle.copyWith(
                  fontWeight: fontWeightSemiBold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
