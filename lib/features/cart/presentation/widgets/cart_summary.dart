import 'package:flutter/material.dart';
import '../../bloc/cart_cubit.dart';

class CartSummary extends StatelessWidget {
  final CartState state;

  const CartSummary({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    const kDark = Color(0xFF0A1128);
    const kPrimary = Color(0xFF4A6CF7);
    const kBg = Color(0xFFF8FAFF);

    return Container(
      margin: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Summary',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
              color: kDark,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 24),
          SummaryRow(
              label: 'Subtotal',
              value: '\$${state.subtotal.toStringAsFixed(2)}'),
          const SizedBox(height: 12),
          const SummaryRow(label: 'Tax & Fees', value: '\$0.00'),
          const SizedBox(height: 12),
          const SummaryRow(
              label: 'Delivery', value: 'Free', valueColor: Colors.green),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(height: 1, color: kBg),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: kDark,
                ),
              ),
              Text(
                '\$${state.subtotal.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: kPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const SummaryRow({
    super.key,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    const kDark = Color(0xFF0A1128);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[500],
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: valueColor ?? kDark,
            fontWeight: FontWeight.w800,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
