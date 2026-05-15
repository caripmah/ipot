import 'package:flutter/material.dart';
import 'order_status_view.dart';

class OrderStatusScreen extends StatelessWidget {
  final String orderId;

  const OrderStatusScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return OrderStatusView(orderId: orderId);
  }
}
