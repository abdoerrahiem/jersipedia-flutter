import 'package:flutter/material.dart';
import 'package:jersipedia/screens/webview_screen.dart';
import 'package:jersipedia/utils/theme.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onPay() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const WebviewScreen(
            title: 'Lanjutkan Pembayaran',
            uri: 'https://google.com',
          ),
        ),
      );
    }

    void onChangeAddress() {
      Navigator.pushNamed(context, '/change-profile');
    }

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
      body: Stack(
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
                      'Jl. Bardannadi\nDesa Pasir Panjang\nKabupaten Mempawah\nProvinsi Kalimantan Barat.',
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
                          padding: const EdgeInsets.symmetric(horizontal: 30),
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
                          'Rp 400.000',
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
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          icon: Icon(Icons.expand_more, color: blackColor),
                          value: '1',
                          items: [
                            DropdownMenuItem(
                              value: '1',
                              child: Text(
                                'JNE',
                                style: blackTextStyle.copyWith(),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '2',
                              child: Text(
                                'JNT',
                                style: blackTextStyle.copyWith(),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '3',
                              child: Text(
                                'Kantor Pos',
                                style: blackTextStyle.copyWith(),
                              ),
                            ),
                          ],
                          onChanged: (value) {}),
                    ),
                    const SizedBox(height: 25),
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
                            'Berat 0.5 kg',
                            style: whiteTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Text(
                          'Rp 15.000',
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
                          '2-3 hari',
                          style: whiteTextStyle.copyWith(
                            fontWeight: fontWeightSemiBold,
                            fontSize: 16,
                          ),
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
                          'Rp. 400.000',
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
                      label: Text('Bayar',
                          style: whiteTextStyle.copyWith(fontSize: 16)),
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
      ),
    );
  }
}
