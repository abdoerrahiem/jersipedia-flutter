import 'package:intl/intl.dart';

String formatRupiah(num number) {
  NumberFormat currencyFormat =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

  return currencyFormat.format(number);
}
