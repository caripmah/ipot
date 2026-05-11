// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderRequest _$OrderRequestFromJson(Map<String, dynamic> json) =>
    _OrderRequest(
      tableId: json['table_id'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItemRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      customerNote: json['customer_note'] as String?,
    );

Map<String, dynamic> _$OrderRequestToJson(_OrderRequest instance) =>
    <String, dynamic>{
      'table_id': instance.tableId,
      'items': instance.items,
      'customer_note': instance.customerNote,
    };

_OrderItemRequest _$OrderItemRequestFromJson(Map<String, dynamic> json) =>
    _OrderItemRequest(
      menuItemId: (json['menu_item_id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      customizations:
          (json['customizations'] as List<dynamic>?)
              ?.map(
                (e) => OrderCustomizationRequest.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$OrderItemRequestToJson(_OrderItemRequest instance) =>
    <String, dynamic>{
      'menu_item_id': instance.menuItemId,
      'quantity': instance.quantity,
      'customizations': instance.customizations,
    };

_OrderCustomizationRequest _$OrderCustomizationRequestFromJson(
  Map<String, dynamic> json,
) => _OrderCustomizationRequest(
  optionId: (json['option_id'] as num).toInt(),
  quantity: (json['quantity'] as num).toInt(),
);

Map<String, dynamic> _$OrderCustomizationRequestToJson(
  _OrderCustomizationRequest instance,
) => <String, dynamic>{
  'option_id': instance.optionId,
  'quantity': instance.quantity,
};

_Order _$OrderFromJson(Map<String, dynamic> json) => _Order(
  id: json['id'] as String,
  tableId: json['table_id'] as String,
  status: $enumDecode(_$OrderStatusEnumMap, json['status']),
  estimatedTime: (json['estimated_time'] as num?)?.toInt(),
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$OrderToJson(_Order instance) => <String, dynamic>{
  'id': instance.id,
  'table_id': instance.tableId,
  'status': _$OrderStatusEnumMap[instance.status]!,
  'estimated_time': instance.estimatedTime,
  'created_at': instance.createdAt,
};

const _$OrderStatusEnumMap = {
  OrderStatus.pending: 'pending',
  OrderStatus.confirmed: 'confirmed',
  OrderStatus.preparing: 'preparing',
  OrderStatus.ready: 'ready',
  OrderStatus.served: 'served',
};
