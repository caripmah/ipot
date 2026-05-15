import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';
import '../../../data/models/cart_models.dart';
import '../../../data/models/menu_models.dart';

// ─── State ───────────────────────────────────────────────────────────────────

class CartState extends Equatable {
  final List<CartItem> items;
  final String? tableId;

  const CartState({this.items = const [], this.tableId});

  @override
  List<Object?> get props => [items, tableId];

  bool get isEmpty => items.isEmpty;

  double get subtotal => items.fold(0.0, (sum, item) => sum + item.totalPrice);

  CartState copyWith({List<CartItem>? items, String? tableId}) {
    return CartState(
      items: items ?? this.items,
      tableId: tableId ?? this.tableId,
    );
  }
}

// ─── Cubit ───────────────────────────────────────────────────────────────────

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  void setTableId(String tableId) {
    emit(state.copyWith(tableId: tableId));
  }

  void addItem(MenuItem menuItem, List<SelectedOption> options) {
    final existingIndex = state.items.indexWhere((item) {
      if (item.menuItem.id != menuItem.id) return false;
      if (item.selectedOptions.length != options.length) return false;

      for (final opt in options) {
        if (!item.selectedOptions.any((o) => o.option.id == opt.option.id)) {
          return false;
        }
      }
      return true;
    });

    if (existingIndex != -1) {
      final existingItem = state.items[existingIndex];
      final updatedItem =
          existingItem.copyWith(quantity: existingItem.quantity + 1);
      final updatedItems = List<CartItem>.from(state.items);
      updatedItems[existingIndex] = updatedItem;
      emit(state.copyWith(items: updatedItems));
    } else {
      final newItem = CartItem(
        id: const Uuid().v4(),
        menuItem: menuItem,
        quantity: 1,
        selectedOptions: options,
      );
      emit(state.copyWith(items: [...state.items, newItem]));
    }
  }

  void incrementQuantity(String id) {
    final updatedItems = state.items.map((item) {
      if (item.id == id) {
        return item.copyWith(quantity: item.quantity + 1);
      }
      return item;
    }).toList();
    emit(state.copyWith(items: updatedItems));
  }

  void decrementQuantity(String id) {
    final updatedItems = state.items
        .map((item) {
          if (item.id == id) {
            return item.copyWith(quantity: item.quantity - 1);
          }
          return item;
        })
        .where((item) => item.quantity > 0)
        .toList();
    emit(state.copyWith(items: updatedItems));
  }

  void removeItem(String id) {
    final updatedItems = state.items.where((item) => item.id != id).toList();
    emit(state.copyWith(items: updatedItems));
  }

  void clearCart() {
    // Pertahankan tableId saat clear, agar tidak perlu scan ulang
    emit(CartState(tableId: state.tableId));
  }
}
