import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ipot_qr_ordering/data/models/cart_models.dart';
import 'package:ipot_qr_ordering/data/models/menu_models.dart';
import 'package:ipot_qr_ordering/features/cart/bloc/cart_cubit.dart';

void main() {
  late CartCubit sut;

  final tMenuItem = MenuItem(
    id: 1,
    name: 'Edamame',
    description: 'Steamed soybeans',
    price: 5.99,
    categoryId: 1,
  );

  final tOption = CustomizationOption(
    id: 1,
    name: 'Truffle Salt',
    priceModifier: 1.50,
  );

  setUp(() => sut = CartCubit());
  tearDown(() => sut.close());

  group('CartCubit', () {
    test('initial state is empty', () {
      expect(sut.state.items, isEmpty);
      expect(sut.state.isEmpty, isTrue);
    });

    blocTest<CartCubit, CartState>(
      'addItem adds a new item to cart',
      build: () => sut,
      act: (c) => c.addItem(tMenuItem, []),
      expect: () => [
        isA<CartState>().having((s) => s.items.length, 'length', 1),
      ],
    );

    blocTest<CartCubit, CartState>(
      'addItem increments quantity for same item + same options',
      build: () => sut,
      act: (c) {
        c.addItem(tMenuItem, []);
        c.addItem(tMenuItem, []);
      },
      expect: () => [
        isA<CartState>().having((s) => s.items.first.quantity, 'qty', 1),
        isA<CartState>().having((s) => s.items.first.quantity, 'qty', 2),
      ],
    );

    blocTest<CartCubit, CartState>(
      'addItem creates separate entry for different options',
      build: () => sut,
      act: (c) {
        c.addItem(tMenuItem, []);
        c.addItem(tMenuItem, [SelectedOption(groupId: 1, option: tOption)]);
      },
      expect: () => [
        isA<CartState>().having((s) => s.items.length, 'length', 1),
        isA<CartState>().having((s) => s.items.length, 'length', 2),
      ],
    );

    test('subtotal calculates correctly with price modifiers', () {
      sut.addItem(tMenuItem, [SelectedOption(groupId: 1, option: tOption)]);
      // 5.99 base + 1.50 modifier = 7.49
      expect(sut.state.subtotal, closeTo(7.49, 0.001));
    });

    test('subtotal multiplies by quantity', () {
      sut.addItem(tMenuItem, []);
      sut.incrementQuantity(sut.state.items.first.id);
      // 5.99 * 2 = 11.98
      expect(sut.state.subtotal, closeTo(11.98, 0.001));
    });

    blocTest<CartCubit, CartState>(
      'decrementQuantity removes item when quantity reaches 0',
      build: () => sut,
      act: (c) {
        c.addItem(tMenuItem, []);
        c.decrementQuantity(c.state.items.first.id);
      },
      expect: () => [
        isA<CartState>().having((s) => s.items.length, 'length', 1),
        isA<CartState>().having((s) => s.isEmpty, 'isEmpty', true),
      ],
    );

    blocTest<CartCubit, CartState>(
      'clearCart empties all items',
      build: () => sut,
      act: (c) {
        c.addItem(tMenuItem, []);
        c.clearCart();
      },
      expect: () => [
        isA<CartState>().having((s) => s.items.length, 'length', 1),
        isA<CartState>().having((s) => s.isEmpty, 'isEmpty', true),
      ],
    );
  });
}
