import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ipot_qr_ordering/data/models/menu_models.dart';
import 'package:ipot_qr_ordering/data/repositories/menu_repository.dart';
import 'package:ipot_qr_ordering/features/menu/bloc/menu_bloc.dart';

class MockMenuRepository extends Mock implements MenuRepository {}

void main() {
  late MenuBloc sut;
  late MockMenuRepository mockRepo;

  final tMenuResponse = MenuResponse(
    restaurant: const Restaurant(id: 'R001', name: 'Sushi Zen', tableId: 'T001'),
    categories: [
      const Category(id: 1, name: 'Appetizers', sortOrder: 1),
      const Category(id: 2, name: 'Main Course', sortOrder: 2),
    ],
    items: [
      const MenuItem(
        id: 1,
        name: 'Edamame',
        description: 'Steamed soybeans',
        price: 5.99,
        categoryId: 1,
      ),
      const MenuItem(
        id: 2,
        name: 'Ramen',
        description: 'Chicken ramen',
        price: 14.99,
        categoryId: 2,
      ),
    ],
  );

  setUp(() {
    mockRepo = MockMenuRepository();
    sut = MenuBloc(menuRepository: mockRepo);
  });

  tearDown(() => sut.close());

  group('MenuBloc', () {
    blocTest<MenuBloc, MenuState>(
      'emits MenuLoaded on successful fetch',
      build: () {
        when(() => mockRepo.getMenu('T001'))
            .thenAnswer((_) async => tMenuResponse);
        return sut;
      },
      act: (b) => b.add(const MenuFetchRequested('T001')),
      expect: () => [
        isA<MenuLoading>(),
        isA<MenuLoaded>(),
      ],
    );

    blocTest<MenuBloc, MenuState>(
      'emits MenuError on fetch failure',
      build: () {
        when(() => mockRepo.getMenu(any()))
            .thenThrow(Exception('Network error'));
        return sut;
      },
      act: (b) => b.add(const MenuFetchRequested('T001')),
      expect: () => [
        isA<MenuLoading>(),
        isA<MenuError>(),
      ],
    );

    blocTest<MenuBloc, MenuState>(
      'filters items by category on MenuCategorySelected',
      build: () {
        when(() => mockRepo.getMenu('T001'))
            .thenAnswer((_) async => tMenuResponse);
        return sut;
      },
      act: (b) {
        b.add(const MenuFetchRequested('T001'));
        b.add(const MenuCategorySelected(1)); // Appetizers only
      },
      expect: () => [
        isA<MenuLoading>(),
        isA<MenuLoaded>().having(
            (s) => s.filteredItems.length, 'all items', 2),
        isA<MenuLoaded>().having(
            (s) => s.filteredItems.length, 'filtered to cat 1', 1),
      ],
    );

    blocTest<MenuBloc, MenuState>(
      'filters items by search query on MenuSearchChanged',
      build: () {
        when(() => mockRepo.getMenu('T001'))
            .thenAnswer((_) async => tMenuResponse);
        return sut;
      },
      act: (b) {
        b.add(const MenuFetchRequested('T001'));
        b.add(const MenuSearchChanged('ramen'));
      },
      expect: () => [
        isA<MenuLoading>(),
        isA<MenuLoaded>()
            .having((s) => s.filteredItems.length, 'all items', 2),
        isA<MenuLoaded>()
            .having((s) => s.filteredItems.length, 'search result', 1)
            .having(
                (s) => s.filteredItems.first.name, 'item name', 'Ramen'),
      ],
    );
  });
}
