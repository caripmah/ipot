import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../cart/bloc/cart_cubit.dart';
import '../../order/bloc/order_bloc.dart';
import '../../../data/models/order_models.dart';
import 'widgets/cart_item_card.dart';
import 'widgets/cart_summary.dart';

// ─── Design Constants ────────────────────────────────────────────────────────
const _kPrimary = Color(0xFF0A1128);
const _kAccent = Color(0xFF4A6CF7);
const _kBg = Color(0xFFF8FAFF);

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _kBg,
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              // ── Header ──
              SliverToBoxAdapter(child: _buildHeader(context, state)),
              
              if (!state.isEmpty)
                SliverToBoxAdapter(child: _buildDeliveryProgress()),

              if (state.isEmpty)
                SliverFillRemaining(child: _buildEmpty(context))
              else ...[
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) =>
                          CartItemCard(item: state.items[index]),
                      childCount: state.items.length,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: CartSummary(state: state),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 140)),
              ],
            ],
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.isEmpty) return const SizedBox.shrink();
          return _buildCheckoutFAB(context, state);
        },
      ),
    );
  }

  Widget _buildDeliveryProgress() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _kAccent.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _kAccent.withValues(alpha: 0.1)),
      ),
      child: Row(
        children: [
          const Icon(Icons. delivery_dining_rounded, color: _kAccent, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Free Delivery',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14, color: _kPrimary),
                ),
                const SizedBox(height: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: const LinearProgressIndicator(
                    value: 1.0,
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation<Color>(_kAccent),
                    minHeight: 6,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          const Text('100%', style: TextStyle(color: _kAccent, fontWeight: FontWeight.w900, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, CartState state) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [_kPrimary, Color(0xFF1C2541)],
        ),
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: _kPrimary.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Back button
              GestureDetector(
                onTap: () => context.pop(),
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
              const Spacer(),
              // Table badge
              if (state.tableId != null)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: _kAccent.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: _kAccent.withValues(alpha: 0.3)),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.table_restaurant_rounded,
                        color: Colors.white,
                        size: 14,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Table ${state.tableId}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              // Clear cart
              if (!state.isEmpty) ...[
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () => _confirmClearCart(context),
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(Icons.delete_outline_rounded,
                        color: Colors.white70, size: 20),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Order\nSummary',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Colors.white,
              height: 1.1,
              fontWeight: FontWeight.w900,
            ),
          ),
          if (!state.isEmpty) ...[
            const SizedBox(height: 8),
            Text(
              '${state.items.length} Delicious Items Ready',
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildEmpty(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              color: _kAccent.withValues(alpha: 0.05),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.shopping_bag_outlined,
              size: 64,
              color: _kAccent,
            ),
          ),
          const SizedBox(height: 32),
          Text(
            'Your Cart is Empty',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w800,
              color: _kPrimary,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Find something delicious in our\nmenu to start your order.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 15,
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () => context.pop(),
              child: const Text('EXPLORE MENU'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutFAB(BuildContext context, CartState state) {
    return BlocListener<OrderBloc, OrderState>(
      listener: (context, orderState) {
        if (orderState is OrderSuccess) {
          context.read<CartCubit>().clearCart();
          context.pushReplacement('/order/${orderState.order.id}');
        } else if (orderState is OrderError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(orderState.message),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          width: double.infinity,
          height: 68,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [_kAccent, Color(0xFF6B8CF7)],
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: _kAccent.withValues(alpha: 0.4),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: () => _checkout(context, state),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Confirm Order',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        '\$${state.subtotal.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: _kAccent,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _confirmClearCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        title: const Text('Clear Cart?',
            style: TextStyle(fontWeight: FontWeight.w800, color: _kPrimary)),
        content: const Text('Are you sure you want to remove all items?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('Keep Items', style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w600)),
          ),
          TextButton(
            onPressed: () {
              context.read<CartCubit>().clearCart();
              Navigator.pop(ctx);
            },
            child: const Text('Yes, Clear',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.w800)),
          ),
        ],
      ),
    );
  }

  void _checkout(BuildContext context, CartState state) {
    if (state.tableId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              const Text('Table info missing. Please scan again.'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      );
      return;
    }

    final request = OrderRequest(
      tableId: state.tableId!,
      items: state.items
          .map(
            (item) => OrderItemRequest(
              menuItemId: item.menuItem.id,
              quantity: item.quantity,
              customizations: item.selectedOptions
                  .map(
                    (o) => OrderCustomizationRequest(
                      optionId: o.option.id,
                      quantity: 1,
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );

    context.read<OrderBloc>().add(OrderCreated(request));
  }
}
