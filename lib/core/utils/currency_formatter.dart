import 'package:intl/intl.dart';

class CurrencyFormatter {
  CurrencyFormatter._();

  static final _formatter = NumberFormat.currency(
    symbol: '\$',
    decimalDigits: 2,
  );

  static String format(double amount) => _formatter.format(amount);

  static String formatDiff(double amount) {
    if (amount == 0) return 'Free';
    return '${amount > 0 ? '+' : ''}${format(amount)}';
  }
}
