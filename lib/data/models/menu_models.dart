import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_models.freezed.dart';
part 'menu_models.g.dart';

@freezed
abstract class MenuResponse with _$MenuResponse {
  const factory MenuResponse({
    required Restaurant restaurant,
    required List<Category> categories,
    required List<MenuItem> items,
  }) = _MenuResponse;

  factory MenuResponse.fromJson(Map<String, dynamic> json) =>
      _$MenuResponseFromJson(json);
}

@freezed
abstract class Restaurant with _$Restaurant {
  const factory Restaurant({
    required String id,
    required String name,
    @JsonKey(name: 'table_id') required String tableId,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
}

@freezed
abstract class Category with _$Category {
  const factory Category({
    required int id,
    required String name,
    @JsonKey(name: 'sort_order') required int sortOrder,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@freezed
abstract class MenuItem with _$MenuItem {
  const factory MenuItem({
    required int id,
    required String name,
    required String description,
    required double price,
    @JsonKey(name: 'category_id') required int categoryId,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'customization_groups')
    @Default([])
    List<CustomizationGroup> customizationGroups,
  }) = _MenuItem;

  factory MenuItem.fromJson(Map<String, dynamic> json) =>
      _$MenuItemFromJson(json);
}

@freezed
abstract class CustomizationGroup with _$CustomizationGroup {
  const factory CustomizationGroup({
    required int id,
    required String name,
    @JsonKey(name: 'required') required bool isRequired,
    @JsonKey(name: 'max_selections') required int maxSelections,
    required List<CustomizationOption> options,
  }) = _CustomizationGroup;

  factory CustomizationGroup.fromJson(Map<String, dynamic> json) =>
      _$CustomizationGroupFromJson(json);
}

@freezed
abstract class CustomizationOption with _$CustomizationOption {
  const factory CustomizationOption({
    required int id,
    required String name,
    @JsonKey(name: 'price_modifier') required double priceModifier,
  }) = _CustomizationOption;

  factory CustomizationOption.fromJson(Map<String, dynamic> json) =>
      _$CustomizationOptionFromJson(json);
}
