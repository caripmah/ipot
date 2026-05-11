import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/menu_bloc.dart';
import '../../cart/bloc/cart_cubit.dart';
import '../../../data/models/menu_models.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../core/di/injection.dart';
import '../widgets/menu_item_card.dart';
import '../widgets/customization_bottom_sheet.dart';

class MenuScreen extends StatelessWidget {
  final String tableId;

  const MenuScreen({super.key, required this.tableId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: state is MenuLoaded
                ? Text(state.menuResponse.restaurant.name)
                : const Text('Menu'),
            bottom: state is MenuLoaded
                ? _SearchBar(
                    onChanged: (q) =>
                        context.read<MenuBloc>().add(MenuSearchChanged(q)),
                  )
                : null,
          ),
          body: switch (state) {
            MenuLoading() => const Center(child: CircularProgressIndicator()),
            MenuError(:final message) => _ErrorView(
                message: message,
                onRetry: () =>
                    context.read<MenuBloc>().add(MenuFetchRequested(tableId)),
              ),
            MenuLoaded() => _MenuBody(state: state),
            _ => const SizedBox.shrink(),
          },
          floatingActionButton: BlocBuilder<CartCubit, CartState>(
            bloc: getIt<CartCubit>(),
            builder: (context, cartState) {
              if (cartState.isEmpty) return const SizedBox.shrink();
              return FloatingActionButton.extended(
                onPressed: () => context.push('/cart'),
                icon: const Icon(Icons.shopping_cart),
                label: Text(
                  '${cartState.totalItems} items · ${CurrencyFormatter.format(cartState.subtotal)}',
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _MenuBody extends StatelessWidget {
  final MenuLoaded state;

  const _MenuBody({required this.state});

  @override
  Widget build(BuildContext context) {
    final categories = [null, ...state.menuResponse.categories];
    return Column(
      children: [
        // Category tabs
        SizedBox(
          height: 44,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final cat = categories[index];
              final isSelected = state.selectedCategoryId == cat?.id;
              return Padding(
                padding: const EdgeInsets.only(right: 8, top: 6, bottom: 6),
                child: ChoiceChip(
                  label: Text(cat?.name ?? 'All'),
                  selected: isSelected,
                  onSelected: (_) => context
                      .read<MenuBloc>()
                      .add(MenuCategorySelected(cat?.id)),
                ),
              );
            },
          ),
        ),
        // Items list
        Expanded(
          child: state.filteredItems.isEmpty
              ? const Center(child: Text('No items found'))
              : ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
                  itemCount: state.filteredItems.length,
                  itemBuilder: (context, index) {
                    final item = state.filteredItems[index];
                    return MenuItemCard(
                      item: item,
                      onAddToCart: () => _onAddToCart(context, item),
                    );
                  },
                ),
        ),
      ],
    );
  }

  void _onAddToCart(BuildContext context, MenuItem item) {
    if (item.customizationGroups.isEmpty) {
      getIt<CartCubit>().addItem(item, []);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${item.name} added to cart'),
          duration: const Duration(seconds: 1),
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (_) => CustomizationBottomSheet(item: item),
      );
    }
  }
}

class _SearchBar extends StatelessWidget implements PreferredSizeWidget {
  final ValueChanged<String> onChanged;

  const _SearchBar({required this.onChanged});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Search menu...',
          prefixIcon: const Icon(Icons.search),
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide.none,
          ),
          filled: true,
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.wifi_off, size: 48, color: Colors.grey),
            const SizedBox(height: 16),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}
