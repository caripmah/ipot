// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MenuResponse _$MenuResponseFromJson(Map<String, dynamic> json) =>
    _MenuResponse(
      restaurant: Restaurant.fromJson(
        json['restaurant'] as Map<String, dynamic>,
      ),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List<dynamic>)
          .map((e) => MenuItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuResponseToJson(_MenuResponse instance) =>
    <String, dynamic>{
      'restaurant': instance.restaurant,
      'categories': instance.categories,
      'items': instance.items,
    };

_Restaurant _$RestaurantFromJson(Map<String, dynamic> json) => _Restaurant(
  id: json['id'] as String,
  name: json['name'] as String,
  tableId: json['table_id'] as String,
);

Map<String, dynamic> _$RestaurantToJson(_Restaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'table_id': instance.tableId,
    };

_Category _$CategoryFromJson(Map<String, dynamic> json) => _Category(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  sortOrder: (json['sort_order'] as num).toInt(),
);

Map<String, dynamic> _$CategoryToJson(_Category instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'sort_order': instance.sortOrder,
};

_MenuItem _$MenuItemFromJson(Map<String, dynamic> json) => _MenuItem(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  price: (json['price'] as num).toDouble(),
  categoryId: (json['category_id'] as num).toInt(),
  imageUrl: json['image_url'] as String?,
  customizationGroups:
      (json['customization_groups'] as List<dynamic>?)
          ?.map((e) => CustomizationGroup.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$MenuItemToJson(_MenuItem instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'price': instance.price,
  'category_id': instance.categoryId,
  'image_url': instance.imageUrl,
  'customization_groups': instance.customizationGroups,
};

_CustomizationGroup _$CustomizationGroupFromJson(Map<String, dynamic> json) =>
    _CustomizationGroup(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      isRequired: json['required'] as bool,
      maxSelections: (json['max_selections'] as num).toInt(),
      options: (json['options'] as List<dynamic>)
          .map((e) => CustomizationOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CustomizationGroupToJson(_CustomizationGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'required': instance.isRequired,
      'max_selections': instance.maxSelections,
      'options': instance.options,
    };

_CustomizationOption _$CustomizationOptionFromJson(Map<String, dynamic> json) =>
    _CustomizationOption(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      priceModifier: (json['price_modifier'] as num).toDouble(),
    );

Map<String, dynamic> _$CustomizationOptionToJson(
  _CustomizationOption instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'price_modifier': instance.priceModifier,
};
