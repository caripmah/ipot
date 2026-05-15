import 'package:flutter/material.dart';
import '../../../../data/models/order_models.dart';

class OrderTimeline extends StatefulWidget {
  final Order order;

  const OrderTimeline({super.key, required this.order});

  @override
  State<OrderTimeline> createState() => _OrderTimelineState();
}

class _OrderTimelineState extends State<OrderTimeline>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const kPrimary = Color(0xFF0A1128);
    const kAccent = Color(0xFF4A6CF7);

    const statuses = OrderStatus.values;
    final currentIndex = widget.order.status.stepIndex;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: kPrimary.withValues(alpha: 0.04),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: List.generate(statuses.length, (index) {
            final status = statuses[index];
            final isCompleted = index < currentIndex;
            final isCurrent = index == currentIndex;
            final isLast = index == statuses.length - 1;

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Timeline column
                SizedBox(
                  width: 44,
                  child: Column(
                    children: [
                      // Dot
                      AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          return Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              gradient: (isCompleted || isCurrent)
                                  ? const LinearGradient(
                                      colors: [kAccent, Color(0xFF6B8CF7)],
                                    )
                                  : null,
                              color: (isCompleted || isCurrent)
                                  ? null
                                  : Colors.grey[200],
                              shape: BoxShape.circle,
                              boxShadow: isCurrent
                                  ? [
                                      BoxShadow(
                                        color: kAccent.withValues(
                                            alpha: 0.3 * _controller.value),
                                        blurRadius:
                                            10 + (10 * _controller.value),
                                        spreadRadius: 2 * _controller.value,
                                      ),
                                    ]
                                  : null,
                            ),
                            child: isCompleted
                                ? const Icon(Icons.check_rounded,
                                    size: 18, color: Colors.white)
                                : isCurrent
                                    ? Center(
                                        child: Container(
                                          width: 10 * _controller.value + 6,
                                          height: 10 * _controller.value + 6,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      )
                                    : null,
                          );
                        },
                      ),
                      // Line
                      if (!isLast)
                        Container(
                          width: 2,
                          height: 50,
                          decoration: BoxDecoration(
                            gradient: isCompleted
                                ? const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [kAccent, Color(0xFF6B8CF7)],
                                  )
                                : null,
                            color: isCompleted ? null : Colors.grey[100],
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                // Label
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          status.label,
                          style: TextStyle(
                            fontWeight:
                                isCurrent ? FontWeight.w900 : FontWeight.w700,
                            color: isCurrent
                                ? kPrimary
                                : isCompleted
                                    ? kPrimary.withValues(alpha: 0.6)
                                    : Colors.grey[400],
                            fontSize: 16,
                          ),
                        ),
                        if (isCurrent) ...[
                          const SizedBox(height: 6),
                          Text(
                            _getStatusDescription(status),
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 13,
                              height: 1.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                        SizedBox(height: isLast ? 0 : 20),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  String _getStatusDescription(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return 'We have received your order and it\'s waiting for confirmation.';
      case OrderStatus.confirmed:
        return 'Restaurant has confirmed your order. Get ready!';
      case OrderStatus.preparing:
        return 'Our chef is now preparing your delicious meal.';
      case OrderStatus.ready:
        return 'Your order is ready! A server will bring it shortly.';
      case OrderStatus.served:
        return 'Order has been served. Enjoy your meal!';
    }
  }
}
