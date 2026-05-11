import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/order_bloc.dart';
import '../../cart/bloc/cart_cubit.dart';
import '../../../core/di/injection.dart';
import '../../../core/utils/currency_formatter.dart';

class OrderConfirmationScreen extends StatelessWidget {
  final String tableId;

  const OrderConfirmationScreen({super.key, required this.tableId});

  @override
  Widget build(BuildContext context) {
    final cartCubit = getIt<CartCubit>();

    return BlocConsumer<OrderBloc, OrderState>(
      listener: (context, state) {
        if (state is OrderSubmitted) {
          cartCubit.clearCart();
          context.go('/order/${state.order.id}/tracking');
        }
        if (state is OrderError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Confirm Order')),
          body: BlocBuilder<CartCubit, CartState>(
            bloc: cartCubit,
            builder: (context, cartState) {
              return Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        Text('Table: $tableId',
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 16),
                        ...cartState.items.map((item) => ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(item.menuItem.name),
                              subtitle: item.selectedOptions.isNotEmpty
                                  ? Text(item.selectedOptions
                                      .map((o) => o.option.name)
                                      .join(', '))
                                  : null,
                              trailing: Text(
                                  '${item.quantity}x ${CurrencyFormatter.format(item.unitPrice)}'),
                            )),
                        const Divider(),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text('Total',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          trailing: Text(
                            CurrencyFormatter.format(cartState.subtotal),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: state is OrderSubmitting
                            ? null
                            : () => context.read<OrderBloc>().add(
                                  OrderSubmitRequested(
                                    tableId: tableId,
                                    cartItems: cartState.items,
                                  ),
                                ),
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: state is OrderSubmitting
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                    strokeWidth: 2, color: Colors.white),
                              )
                            : const Text('Confirm & Place Order'),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
