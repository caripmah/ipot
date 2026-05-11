import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/menu_models.dart';
import '../../../data/repositories/menu_repository.dart';
import '../../../core/utils/app_logger.dart';

// ─── Events ───────────────────────────────────────────────────────────────────

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
  final int? categoryId; // null = show all

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

// ─── States ───────────────────────────────────────────────────────────────────

abstract class MenuState extends Equatable {
  const MenuState();

  @override
  List<Object?> get props => [];
}

class MenuInitial extends MenuState {
  const MenuInitial();
}

class MenuLoading extends MenuState {
  const MenuLoading();
}

class MenuLoaded extends MenuState {
  final MenuResponse menuResponse;
  final int? selectedCategoryId;
  final String searchQuery;

  const MenuLoaded({
    required this.menuResponse,
    this.selectedCategoryId,
    this.searchQuery = '',
  });

  List<MenuItem> get filteredItems {
    var items = menuResponse.items;

    if (selectedCategoryId != null) {
      items = items.where((i) => i.categoryId == selectedCategoryId).toList();
    }

    if (searchQuery.isNotEmpty) {
      final q = searchQuery.toLowerCase();
      items = items
          .where((i) =>
              i.name.toLowerCase().contains(q) ||
              i.description.toLowerCase().contains(q))
          .toList();
    }

    return items;
  }

  MenuLoaded copyWithFilter({
    int? selectedCategoryId,
    bool clearCategory = false,
    String? searchQuery,
  }) {
    return MenuLoaded(
      menuResponse: menuResponse,
      selectedCategoryId:
          clearCategory ? null : (selectedCategoryId ?? this.selectedCategoryId),
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object?> get props =>
      [menuResponse, selectedCategoryId, searchQuery];
}

class MenuError extends MenuState {
  final String message;

  const MenuError(this.message);

  @override
  List<Object?> get props => [message];
}

// ─── Bloc ─────────────────────────────────────────────────────────────────────

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final MenuRepository _menuRepository;

  MenuBloc({required MenuRepository menuRepository})
      : _menuRepository = menuRepository,
        super(const MenuInitial()) {
    on<MenuFetchRequested>(_onFetchRequested);
    on<MenuCategorySelected>(_onCategorySelected);
    on<MenuSearchChanged>(_onSearchChanged);
  }

  Future<void> _onFetchRequested(
    MenuFetchRequested event,
    Emitter<MenuState> emit,
  ) async {
    emit(const MenuLoading());
    try {
      final response = await _menuRepository.getMenu(event.tableId);
      emit(MenuLoaded(menuResponse: response));
    } catch (e) {
      AppLogger.error('MenuBloc fetch error', e);
      emit(MenuError(e.toString()));
    }
  }

  void _onCategorySelected(
    MenuCategorySelected event,
    Emitter<MenuState> emit,
  ) {
    final current = state;
    if (current is MenuLoaded) {
      emit(current.copyWithFilter(
        selectedCategoryId: event.categoryId,
        clearCategory: event.categoryId == null,
      ));
    }
  }

  void _onSearchChanged(
    MenuSearchChanged event,
    Emitter<MenuState> emit,
  ) {
    final current = state;
    if (current is MenuLoaded) {
      emit(current.copyWithFilter(searchQuery: event.query));
    }
  }
}
