import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_models.freezed.dart';
part 'order_models.g.dart';

enum OrderStatus {
  @JsonValue('pending') pending,
  @JsonValue('confirmed') confirmed,
  @JsonValue('preparing') preparing,
  @JsonValue('ready') ready,
  @JsonValue('served') served,
}

extension OrderStatusX on OrderStatus {
  String get label {
    switch (this) {
      case OrderStatus.pending: return 'Pending';
      case OrderStatus.confirmed: return 'Confirmed';
      case OrderStatus.preparing: return 'Preparing';
      case OrderStatus.ready: return 'Ready';
      case OrderStatus.served: return 'Served';
    }
  }

  int get stepIndex {
    return OrderStatus.values.indexOf(this);
  }
}

@freezed
class OrderRequest with _$OrderRequest {
  const factory OrderRequest({
    @JsonKey(name: 'table_id') required String tableId,
    required List<OrderItemRequest> items,
    @JsonKey(name: 'customer_note') String? customerNote,
  }) = _OrderRequest;

  factory OrderRequest.fromJson(Map<String, dynamic> json) =>
      _$OrderRequestFromJson(json);
}

@freezed
class OrderItemRequest with _$OrderItemRequest {
  const factory OrderItemRequest({
    @JsonKey(name: 'menu_item_id') required int menuItemId,
    required int quantity,
    @Default([]) List<OrderCustomizationRequest> customizations,
  }) = _OrderItemRequest;

  factory OrderItemRequest.fromJson(Map<String, dynamic> json) =>
      _$OrderItemRequestFromJson(json);
}

@freezed
class OrderCustomizationRequest with _$OrderCustomizationRequest {
  const factory OrderCustomizationRequest({
    @JsonKey(name: 'option_id') required int optionId,
    required int quantity,
  }) = _OrderCustomizationRequest;

  factory OrderCustomizationRequest.fromJson(Map<String, dynamic> json) =>
      _$OrderCustomizationRequestFromJson(json);
}

@freezed
class Order with _$Order {
  const factory Order({
    required String id,
    @JsonKey(name: 'table_id') required String tableId,
    required OrderStatus status,
    @JsonKey(name: 'estimated_time') int? estimatedTime,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
