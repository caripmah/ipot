import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/cart_cubit.dart';

class CartItemCard extends StatelessWidget {
  final dynamic item;

  const CartItemCard({super.key, required this.item});

  Color _getItemColor(int id) {
    const colors = [
      Color(0xFFFFB74D),
      Color(0xFF81C784),
      Color(0xFF64B5F6),
      Color(0xFFE57373),
      Color(0xFFBA68C8),
      Color(0xFF4DB6AC),
    ];
    return colors[id % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    const kDark = Color(0xFF0A1128);
    const kPrimary = Color(0xFF4A6CF7);
    const kBg = Color(0xFFF8FAFF);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: _getItemColor(item.menuItem.id),
                borderRadius: BorderRadius.circular(16),
              ),
              child: item.menuItem.imageUrl != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        item.menuItem.imageUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Icon(
                          Icons.restaurant,
                          color: Colors.white70,
                          size: 32,
                        ),
                      ),
                    )
                  : const Icon(
                      Icons.restaurant,
                      color: Colors.white70,
                      size: 32,
                    ),
            ),
            const SizedBox(width: 16),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          item.menuItem.name,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: kDark,
                          ),
                        ),
                      ),
                      // Remove button
                      GestureDetector(
                        onTap: () =>
                            context.read<CartCubit>().removeItem(item.id),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.red.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.close,
                            size: 14,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (item.selectedOptions.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      item.selectedOptions.map((o) => o.option.name).join(', '),
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 12,
                        height: 1.3,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$${item.unitPrice.toStringAsFixed(2)} each',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '\$${item.totalPrice.toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: kPrimary,
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),

                      // Quantity stepper
                      Container(
                        decoration: BoxDecoration(
                          color: kBg,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            StepperBtn(
                              icon: Icons.remove,
                              onPressed: () => context
                                  .read<CartCubit>().decrementQuantity(item.id),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              child: Text(
                                '${item.quantity}',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: kDark,
                                ),
                              ),
                            ),
                            StepperBtn(
                              icon: Icons.add,
                              onPressed: () => context
                                  .read<CartCubit>().incrementQuantity(item.id),
                              filled: true,
                            ),
                          ],
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
    );
  }
}

class StepperBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final bool filled;

  const StepperBtn({
    super.key,
    required this.icon,
    required this.onPressed,
    this.filled = false,
  });

  @override
  Widget build(BuildContext context) {
    const kPrimary = Color(0xFF4A6CF7);
    const kPrimaryLight = Color(0xFF6B8CF7);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          gradient: filled
              ? const LinearGradient(
                  colors: [kPrimary, kPrimaryLight],
                )
              : null,
          color: filled ? null : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: filled
              ? [
                  BoxShadow(
                    color: kPrimary.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ]
              : null,
        ),
        child: Icon(
          icon,
          size: 16,
          color: filled ? Colors.white : Colors.grey[600],
        ),
      ),
    );
  }
}
