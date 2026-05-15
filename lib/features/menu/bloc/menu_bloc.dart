import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:developer' as developer;
import '../../../data/models/menu_models.dart';
import '../../../data/repositories/menu_repository.dart';

// ─── Events ──────────────────────────────────────────────────────────────────

abstract class MenuEvent extends Equatable {
  const MenuEvent();
  @override
  List<Object?> get props => [];
}

class MenuFetchRequested extends MenuEvent {
  final String tableId;
  const MenuFetchRequested(this.tableId);
  @override
  List<Object?> get props => [tableId];
}

class MenuCategorySelected extends MenuEvent {
  final int? categoryId;
  const MenuCategorySelected(this.categoryId);
  @override
  List<Object?> get props => [categoryId];
}

class MenuSearchChanged extends MenuEvent {
  final String query;
  const MenuSearchChanged(this.query);
  @override
  List<Object?> get props => [query];
}

// ─── States ──────────────────────────────────────────────────────────────────

abstract class MenuState extends Equatable {
  const MenuState();
  @override
  List<Object?> get props => [];
}

class MenuInitial extends MenuState {}

class MenuLoading extends MenuState {}

class MenuLoaded extends MenuState {
  final MenuResponse menu;
  final List<MenuItem> filteredItems;
  final int? selectedCategoryId;
  final String searchQuery;

  const MenuLoaded({
    required this.menu,
    required this.filteredItems,
    this.selectedCategoryId,
    this.searchQuery = '',
  });

  @override
  List<Object?> get props =>
      [menu, filteredItems, selectedCategoryId, searchQuery];

  MenuLoaded copyWith({
    MenuResponse? menu,
    List<MenuItem>? filteredItems,
    int? selectedCategoryId,
    bool clearCategory = false,
    String? searchQuery,
  }) {
    return MenuLoaded(
      menu: menu ?? this.menu,
      filteredItems: filteredItems ?? this.filteredItems,
      selectedCategoryId: clearCategory
          ? null
          : (selectedCategoryId ?? this.selectedCategoryId),
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

class MenuError extends MenuState {
  final String message;
  const MenuError(this.message);
  @override
  List<Object?> get props => [message];
}

// ─── BLoC ────────────────────────────────────────────────────────────────────

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final MenuRepository menuRepository;

  MenuBloc({required this.menuRepository}) : super(MenuInitial()) {
    on<MenuFetchRequested>(_onFetchRequested);
    on<MenuCategorySelected>(_onCategorySelected);
    on<MenuSearchChanged>(_onSearchChanged);
  }

  Future<void> _onFetchRequested(
    MenuFetchRequested event,
    Emitter<MenuState> emit,
  ) async {
    developer.log('📡 Fetching menu for table: ${event.tableId}',
        name: 'MenuBloc');
    emit(MenuLoading());
    try {
      final menu = await menuRepository.getMenu(event.tableId);
      developer.log('✅ Menu fetched: ${menu.items.length} items',
          name: 'MenuBloc');
      emit(MenuLoaded(
        menu: menu,
        filteredItems: menu.items,
      ));
    } catch (e, stackTrace) {
      developer.log('❌ Error fetching menu: $e',
          name: 'MenuBloc', error: e, stackTrace: stackTrace);
      emit(MenuError('Failed to load menu: ${e.toString()}'));
    }
  }

  void _onCategorySelected(
    MenuCategorySelected event,
    Emitter<MenuState> emit,
  ) {
    final currentState = state;
    if (currentState is MenuLoaded) {
      final filtered = _filterItems(
        currentState.menu.items,
        event.categoryId,
        currentState.searchQuery,
      );
      emit(currentState.copyWith(
        filteredItems: filtered,
        selectedCategoryId: event.categoryId,
        clearCategory: event.categoryId == null,
      ));
    }
  }

  void _onSearchChanged(
    MenuSearchChanged event,
    Emitter<MenuState> emit,
  ) {
    final currentState = state;
    if (currentState is MenuLoaded) {
      final filtered = _filterItems(
        currentState.menu.items,
        currentState.selectedCategoryId,
        event.query,
      );
      emit(currentState.copyWith(
        filteredItems: filtered,
        searchQuery: event.query,
      ));
    }
  }

  List<MenuItem> _filterItems(
    List<MenuItem> items,
    int? categoryId,
    String query,
  ) {
    return items.where((item) {
      final matchesCategory =
          categoryId == null || item.categoryId == categoryId;
      final matchesSearch = query.isEmpty ||
          item.name.toLowerCase().contains(query.toLowerCase()) ||
          item.description.toLowerCase().contains(query.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }
}
