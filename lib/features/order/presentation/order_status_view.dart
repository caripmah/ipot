import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../data/models/order_models.dart';
import '../bloc/order_bloc.dart';
import 'widgets/order_status_header.dart';
import 'widgets/order_timeline.dart';

const _kPrimary = Color(0xFF0A1128);
const _kAccent = Color(0xFF4A6CF7);
const _kBg = Color(0xFFF8FAFF);

class OrderStatusView extends StatelessWidget {
  final String orderId;

  const OrderStatusView({super.key, required this.orderId});

  void _fetchStatus(BuildContext context) {
    context.read<OrderBloc>().add(OrderStatusChecked(orderId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _kBg,
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state is OrderLoading) {
            return const Center(
              child: CircularProgressIndicator(color: _kAccent),
            );
          } else if (state is OrderSuccess) {
            return _buildContent(context, state.order);
          } else if (state is OrderError) {
            return _buildError(context, state.message);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildError(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.red.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
              child:
                  const Icon(Icons.error_outline, size: 40, color: Colors.red),
            ),
            const SizedBox(height: 20),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () => _fetchStatus(context),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                decoration: BoxDecoration(
                  gradient:
                      const LinearGradient(colors: [_kAccent, Color(0xFF6B8CF7)]),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  'Retry',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, Order order) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: OrderStatusHeader(
            order: order,
            onRefresh: () => _fetchStatus(context),
          ),
        ),
        SliverToBoxAdapter(child: OrderTimeline(order: order)),
        SliverToBoxAdapter(child: _buildActions(context)),
        const SliverToBoxAdapter(child: SizedBox(height: 40)),
      ],
    );
  }

  Widget _buildActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      child: GestureDetector(
        onTap: () => context.go('/scanner'),
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _kAccent.withValues(alpha: 0.3),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: _kPrimary.withValues(alpha: 0.04),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.qr_code_scanner, color: _kAccent, size: 20),
              SizedBox(width: 10),
              Text(
                'Place Another Order',
                style: TextStyle(
                  color: _kAccent,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
