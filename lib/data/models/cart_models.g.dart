// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartItem _$CartItemFromJson(Map<String, dynamic> json) => _CartItem(
  id: json['id'] as String,
  menuItem: MenuItem.fromJson(json['menuItem'] as Map<String, dynamic>),
  quantity: (json['quantity'] as num).toInt(),
  selectedOptions:
      (json['selectedOptions'] as List<dynamic>?)
          ?.map((e) => SelectedOption.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  note: json['note'] as String?,
);

Map<String, dynamic> _$CartItemToJson(_CartItem instance) => <String, dynamic>{
  'id': instance.id,
  'menuItem': instance.menuItem,
  'quantity': instance.quantity,
  'selectedOptions': instance.selectedOptions,
  'note': instance.note,
};

_SelectedOption _$SelectedOptionFromJson(Map<String, dynamic> json) =>
    _SelectedOption(
      groupId: (json['groupId'] as num).toInt(),
      option: CustomizationOption.fromJson(
        json['option'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$SelectedOptionToJson(_SelectedOption instance) =>
    <String, dynamic>{'groupId': instance.groupId, 'option': instance.option};
