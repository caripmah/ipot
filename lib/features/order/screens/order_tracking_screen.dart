import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/order_bloc.dart';
import '../../../data/models/order_models.dart';

class OrderTrackingScreen extends StatelessWidget {
  final String orderId;

  const OrderTrackingScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Order Status'),
            automaticallyImplyLeading: false,
          ),
          body: switch (state) {
            OrderTracking(:final order) => _TrackingBody(order: order),
            OrderSubmitted(:final order) => _TrackingBody(order: order),
            OrderError(:final message) => Center(
                child: Text(message, textAlign: TextAlign.center),
              ),
            _ => const Center(child: CircularProgressIndicator()),
          },
        );
      },
    );
  }
}

class _TrackingBody extends StatelessWidget {
  final Order order;

  const _TrackingBody({required this.order});

  static const _steps = OrderStatus.values;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Order ID
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Order #${order.id}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
          ),
          const SizedBox(height: 32),

          // Status stepper
          ..._buildStepperItems(context),

          const SizedBox(height: 32),

          // Estimated time
          if (order.estimatedTime != null)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.access_time),
                    const SizedBox(width: 8),
                    Text('Estimated time: ~${order.estimatedTime} min'),
                  ],
                ),
              ),
            ),

          if (order.status == OrderStatus.served) ...[
            const SizedBox(height: 24),
            const Icon(Icons.check_circle, size: 64, color: Colors.green),
            const SizedBox(height: 8),
            Text(
              'Enjoy your meal! 🍽️',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ],
      ),
    );
  }

  List<Widget> _buildStepperItems(BuildContext context) {
    final currentIndex = order.status.stepIndex;

    return _steps.asMap().entries.map((entry) {
      final index = entry.key;
      final step = entry.value;
      final isDone = index < currentIndex;
      final isCurrent = index == currentIndex;

      return Row(
        children: [
          Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDone || isCurrent
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.outlineVariant,
                ),
                child: Icon(
                  isDone ? Icons.check : Icons.circle,
                  size: isCurrent ? 14 : 10,
                  color: isDone || isCurrent
                      ? Colors.white
                      : Colors.transparent,
                ),
              ),
              if (index < _steps.length - 1)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 2,
                  height: 28,
                  color: isDone
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.outlineVariant,
                ),
            ],
          ),
          const SizedBox(width: 16),
          Padding(
            padding: const EdgeInsets.only(bottom: 28),
            child: Text(
              step.label,
              style: TextStyle(
                fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                color: isCurrent
                    ? Theme.of(context).colorScheme.primary
                    : isDone
                        ? Colors.black87
                        : Colors.grey,
              ),
            ),
          ),
        ],
      );
    }).toList();
  }
}
