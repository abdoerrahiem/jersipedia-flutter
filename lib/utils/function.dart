import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jersipedia/utils/theme.dart';

String formatRupiah(num number) {
  NumberFormat currencyFormat =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

  return currencyFormat.format(number);
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

enum SnackbarType { success, error }

void showSnackbar(
    {required BuildContext context, required message, SnackbarType? type}) {
  Flushbar(
    message: message,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: type == SnackbarType.success ? greenColor : redColor,
    duration: const Duration(seconds: 3),
  ).show(context);
}
