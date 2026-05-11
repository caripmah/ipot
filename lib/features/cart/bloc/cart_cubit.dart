import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/cart_models.dart';
import '../../../data/models/menu_models.dart';

// ─── State ────────────────────────────────────────────────────────────────────

class CartState extends Equatable {
  final List<CartItem> items;

  const CartState({this.items = const []});

  int get totalItems => items.fold(0, (sum, i) => sum + i.quantity);

  double get subtotal => items.fold(0.0, (sum, i) => sum + i.totalPrice);

  bool get isEmpty => items.isEmpty;

  @override
  List<Object?> get props => [items];
}

// ─── Cubit ────────────────────────────────────────────────────────────────────

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  void addItem(MenuItem menuItem, List<SelectedOption> selectedOptions) {
    final cartItemId = _buildItemId(menuItem.id, selectedOptions);
    final existingIndex = state.items.indexWhere((i) => i.id == cartItemId);

    List<CartItem> updatedItems;

    if (existingIndex >= 0) {
      // Same item + same options → increment quantity
      updatedItems = List.from(state.items);
      updatedItems[existingIndex] = updatedItems[existingIndex].copyWith(
        quantity: updatedItems[existingIndex].quantity + 1,
      );
    } else {
      // New cart entry
      updatedItems = [
        ...state.items,
        CartItem(
          id: cartItemId,
          menuItem: menuItem,
          quantity: 1,
          selectedOptions: selectedOptions,
        ),
      ];
    }

    emit(CartState(items: updatedItems));
  }

  void incrementQuantity(String cartItemId) {
    final updatedItems = state.items.map((item) {
      if (item.id == cartItemId) {
        return item.copyWith(quantity: item.quantity + 1);
      }
      return item;
    }).toList();

    emit(CartState(items: updatedItems));
  }

  void decrementQuantity(String cartItemId) {
    final updatedItems = state.items
        .map((item) {
          if (item.id == cartItemId) {
            return item.copyWith(quantity: item.quantity - 1);
          }
          return item;
        })
        .where((item) => item.quantity > 0) // remove if reaches 0
        .toList();

    emit(CartState(items: updatedItems));
  }

  void removeItem(String cartItemId) {
    emit(CartState(
      items: state.items.where((i) => i.id != cartItemId).toList(),
    ));
  }

  void clearCart() {
    emit(const CartState());
  }

  String _buildItemId(int menuItemId, List<SelectedOption> options) {
    final optionIds = options.map((o) => o.option.id).toList()..sort();
    return '${menuItemId}_${optionIds.join('-')}';
  }
}
