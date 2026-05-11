// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderRequest {

@JsonKey(name: 'table_id') String get tableId; List<OrderItemRequest> get items;@JsonKey(name: 'customer_note') String? get customerNote;
/// Create a copy of OrderRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderRequestCopyWith<OrderRequest> get copyWith => _$OrderRequestCopyWithImpl<OrderRequest>(this as OrderRequest, _$identity);

  /// Serializes this OrderRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderRequest&&(identical(other.tableId, tableId) || other.tableId == tableId)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.customerNote, customerNote) || other.customerNote == customerNote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tableId,const DeepCollectionEquality().hash(items),customerNote);

@override
String toString() {
  return 'OrderRequest(tableId: $tableId, items: $items, customerNote: $customerNote)';
}


}

/// @nodoc
abstract mixin class $OrderRequestCopyWith<$Res>  {
  factory $OrderRequestCopyWith(OrderRequest value, $Res Function(OrderRequest) _then) = _$OrderRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'table_id') String tableId, List<OrderItemRequest> items,@JsonKey(name: 'customer_note') String? customerNote
});




}
/// @nodoc
class _$OrderRequestCopyWithImpl<$Res>
    implements $OrderRequestCopyWith<$Res> {
  _$OrderRequestCopyWithImpl(this._self, this._then);

  final OrderRequest _self;
  final $Res Function(OrderRequest) _then;

/// Create a copy of OrderRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tableId = null,Object? items = null,Object? customerNote = freezed,}) {
  return _then(_self.copyWith(
tableId: null == tableId ? _self.tableId : tableId // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemRequest>,customerNote: freezed == customerNote ? _self.customerNote : customerNote // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderRequest].
extension OrderRequestPatterns on OrderRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderRequest value)  $default,){
final _that = this;
switch (_that) {
case _OrderRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderRequest value)?  $default,){
final _that = this;
switch (_that) {
case _OrderRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'table_id')  String tableId,  List<OrderItemRequest> items, @JsonKey(name: 'customer_note')  String? customerNote)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderRequest() when $default != null:
return $default(_that.tableId,_that.items,_that.customerNote);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'table_id')  String tableId,  List<OrderItemRequest> items, @JsonKey(name: 'customer_note')  String? customerNote)  $default,) {final _that = this;
switch (_that) {
case _OrderRequest():
return $default(_that.tableId,_that.items,_that.customerNote);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'table_id')  String tableId,  List<OrderItemRequest> items, @JsonKey(name: 'customer_note')  String? customerNote)?  $default,) {final _that = this;
switch (_that) {
case _OrderRequest() when $default != null:
return $default(_that.tableId,_that.items,_that.customerNote);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderRequest implements OrderRequest {
  const _OrderRequest({@JsonKey(name: 'table_id') required this.tableId, required final  List<OrderItemRequest> items, @JsonKey(name: 'customer_note') this.customerNote}): _items = items;
  factory _OrderRequest.fromJson(Map<String, dynamic> json) => _$OrderRequestFromJson(json);

@override@JsonKey(name: 'table_id') final  String tableId;
 final  List<OrderItemRequest> _items;
@override List<OrderItemRequest> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey(name: 'customer_note') final  String? customerNote;

/// Create a copy of OrderRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderRequestCopyWith<_OrderRequest> get copyWith => __$OrderRequestCopyWithImpl<_OrderRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderRequest&&(identical(other.tableId, tableId) || other.tableId == tableId)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.customerNote, customerNote) || other.customerNote == customerNote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tableId,const DeepCollectionEquality().hash(_items),customerNote);

@override
String toString() {
  return 'OrderRequest(tableId: $tableId, items: $items, customerNote: $customerNote)';
}


}

/// @nodoc
abstract mixin class _$OrderRequestCopyWith<$Res> implements $OrderRequestCopyWith<$Res> {
  factory _$OrderRequestCopyWith(_OrderRequest value, $Res Function(_OrderRequest) _then) = __$OrderRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'table_id') String tableId, List<OrderItemRequest> items,@JsonKey(name: 'customer_note') String? customerNote
});




}
/// @nodoc
class __$OrderRequestCopyWithImpl<$Res>
    implements _$OrderRequestCopyWith<$Res> {
  __$OrderRequestCopyWithImpl(this._self, this._then);

  final _OrderRequest _self;
  final $Res Function(_OrderRequest) _then;

/// Create a copy of OrderRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tableId = null,Object? items = null,Object? customerNote = freezed,}) {
  return _then(_OrderRequest(
tableId: null == tableId ? _self.tableId : tableId // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemRequest>,customerNote: freezed == customerNote ? _self.customerNote : customerNote // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$OrderItemRequest {

@JsonKey(name: 'menu_item_id') int get menuItemId; int get quantity; List<OrderCustomizationRequest> get customizations;
/// Create a copy of OrderItemRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemRequestCopyWith<OrderItemRequest> get copyWith => _$OrderItemRequestCopyWithImpl<OrderItemRequest>(this as OrderItemRequest, _$identity);

  /// Serializes this OrderItemRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItemRequest&&(identical(other.menuItemId, menuItemId) || other.menuItemId == menuItemId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&const DeepCollectionEquality().equals(other.customizations, customizations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,menuItemId,quantity,const DeepCollectionEquality().hash(customizations));

@override
String toString() {
  return 'OrderItemRequest(menuItemId: $menuItemId, quantity: $quantity, customizations: $customizations)';
}


}

/// @nodoc
abstract mixin class $OrderItemRequestCopyWith<$Res>  {
  factory $OrderItemRequestCopyWith(OrderItemRequest value, $Res Function(OrderItemRequest) _then) = _$OrderItemRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'menu_item_id') int menuItemId, int quantity, List<OrderCustomizationRequest> customizations
});




}
/// @nodoc
class _$OrderItemRequestCopyWithImpl<$Res>
    implements $OrderItemRequestCopyWith<$Res> {
  _$OrderItemRequestCopyWithImpl(this._self, this._then);

  final OrderItemRequest _self;
  final $Res Function(OrderItemRequest) _then;

/// Create a copy of OrderItemRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? menuItemId = null,Object? quantity = null,Object? customizations = null,}) {
  return _then(_self.copyWith(
menuItemId: null == menuItemId ? _self.menuItemId : menuItemId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,customizations: null == customizations ? _self.customizations : customizations // ignore: cast_nullable_to_non_nullable
as List<OrderCustomizationRequest>,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderItemRequest].
extension OrderItemRequestPatterns on OrderItemRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItemRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItemRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItemRequest value)  $default,){
final _that = this;
switch (_that) {
case _OrderItemRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItemRequest value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItemRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'menu_item_id')  int menuItemId,  int quantity,  List<OrderCustomizationRequest> customizations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderItemRequest() when $default != null:
return $default(_that.menuItemId,_that.quantity,_that.customizations);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'menu_item_id')  int menuItemId,  int quantity,  List<OrderCustomizationRequest> customizations)  $default,) {final _that = this;
switch (_that) {
case _OrderItemRequest():
return $default(_that.menuItemId,_that.quantity,_that.customizations);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'menu_item_id')  int menuItemId,  int quantity,  List<OrderCustomizationRequest> customizations)?  $default,) {final _that = this;
switch (_that) {
case _OrderItemRequest() when $default != null:
return $default(_that.menuItemId,_that.quantity,_that.customizations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderItemRequest implements OrderItemRequest {
  const _OrderItemRequest({@JsonKey(name: 'menu_item_id') required this.menuItemId, required this.quantity, final  List<OrderCustomizationRequest> customizations = const []}): _customizations = customizations;
  factory _OrderItemRequest.fromJson(Map<String, dynamic> json) => _$OrderItemRequestFromJson(json);

@override@JsonKey(name: 'menu_item_id') final  int menuItemId;
@override final  int quantity;
 final  List<OrderCustomizationRequest> _customizations;
@override@JsonKey() List<OrderCustomizationRequest> get customizations {
  if (_customizations is EqualUnmodifiableListView) return _customizations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_customizations);
}


/// Create a copy of OrderItemRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemRequestCopyWith<_OrderItemRequest> get copyWith => __$OrderItemRequestCopyWithImpl<_OrderItemRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderItemRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItemRequest&&(identical(other.menuItemId, menuItemId) || other.menuItemId == menuItemId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&const DeepCollectionEquality().equals(other._customizations, _customizations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,menuItemId,quantity,const DeepCollectionEquality().hash(_customizations));

@override
String toString() {
  return 'OrderItemRequest(menuItemId: $menuItemId, quantity: $quantity, customizations: $customizations)';
}


}

/// @nodoc
abstract mixin class _$OrderItemRequestCopyWith<$Res> implements $OrderItemRequestCopyWith<$Res> {
  factory _$OrderItemRequestCopyWith(_OrderItemRequest value, $Res Function(_OrderItemRequest) _then) = __$OrderItemRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'menu_item_id') int menuItemId, int quantity, List<OrderCustomizationRequest> customizations
});




}
/// @nodoc
class __$OrderItemRequestCopyWithImpl<$Res>
    implements _$OrderItemRequestCopyWith<$Res> {
  __$OrderItemRequestCopyWithImpl(this._self, this._then);

  final _OrderItemRequest _self;
  final $Res Function(_OrderItemRequest) _then;

/// Create a copy of OrderItemRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? menuItemId = null,Object? quantity = null,Object? customizations = null,}) {
  return _then(_OrderItemRequest(
menuItemId: null == menuItemId ? _self.menuItemId : menuItemId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,customizations: null == customizations ? _self._customizations : customizations // ignore: cast_nullable_to_non_nullable
as List<OrderCustomizationRequest>,
  ));
}


}


/// @nodoc
mixin _$OrderCustomizationRequest {

@JsonKey(name: 'option_id') int get optionId; int get quantity;
/// Create a copy of OrderCustomizationRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderCustomizationRequestCopyWith<OrderCustomizationRequest> get copyWith => _$OrderCustomizationRequestCopyWithImpl<OrderCustomizationRequest>(this as OrderCustomizationRequest, _$identity);

  /// Serializes this OrderCustomizationRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderCustomizationRequest&&(identical(other.optionId, optionId) || other.optionId == optionId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,optionId,quantity);

@override
String toString() {
  return 'OrderCustomizationRequest(optionId: $optionId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $OrderCustomizationRequestCopyWith<$Res>  {
  factory $OrderCustomizationRequestCopyWith(OrderCustomizationRequest value, $Res Function(OrderCustomizationRequest) _then) = _$OrderCustomizationRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'option_id') int optionId, int quantity
});




}
/// @nodoc
class _$OrderCustomizationRequestCopyWithImpl<$Res>
    implements $OrderCustomizationRequestCopyWith<$Res> {
  _$OrderCustomizationRequestCopyWithImpl(this._self, this._then);

  final OrderCustomizationRequest _self;
  final $Res Function(OrderCustomizationRequest) _then;

/// Create a copy of OrderCustomizationRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? optionId = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
optionId: null == optionId ? _self.optionId : optionId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderCustomizationRequest].
extension OrderCustomizationRequestPatterns on OrderCustomizationRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderCustomizationRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderCustomizationRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderCustomizationRequest value)  $default,){
final _that = this;
switch (_that) {
case _OrderCustomizationRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderCustomizationRequest value)?  $default,){
final _that = this;
switch (_that) {
case _OrderCustomizationRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'option_id')  int optionId,  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderCustomizationRequest() when $default != null:
return $default(_that.optionId,_that.quantity);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'option_id')  int optionId,  int quantity)  $default,) {final _that = this;
switch (_that) {
case _OrderCustomizationRequest():
return $default(_that.optionId,_that.quantity);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'option_id')  int optionId,  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _OrderCustomizationRequest() when $default != null:
return $default(_that.optionId,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderCustomizationRequest implements OrderCustomizationRequest {
  const _OrderCustomizationRequest({@JsonKey(name: 'option_id') required this.optionId, required this.quantity});
  factory _OrderCustomizationRequest.fromJson(Map<String, dynamic> json) => _$OrderCustomizationRequestFromJson(json);

@override@JsonKey(name: 'option_id') final  int optionId;
@override final  int quantity;

/// Create a copy of OrderCustomizationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCustomizationRequestCopyWith<_OrderCustomizationRequest> get copyWith => __$OrderCustomizationRequestCopyWithImpl<_OrderCustomizationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderCustomizationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderCustomizationRequest&&(identical(other.optionId, optionId) || other.optionId == optionId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,optionId,quantity);

@override
String toString() {
  return 'OrderCustomizationRequest(optionId: $optionId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$OrderCustomizationRequestCopyWith<$Res> implements $OrderCustomizationRequestCopyWith<$Res> {
  factory _$OrderCustomizationRequestCopyWith(_OrderCustomizationRequest value, $Res Function(_OrderCustomizationRequest) _then) = __$OrderCustomizationRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'option_id') int optionId, int quantity
});




}
/// @nodoc
class __$OrderCustomizationRequestCopyWithImpl<$Res>
    implements _$OrderCustomizationRequestCopyWith<$Res> {
  __$OrderCustomizationRequestCopyWithImpl(this._self, this._then);

  final _OrderCustomizationRequest _self;
  final $Res Function(_OrderCustomizationRequest) _then;

/// Create a copy of OrderCustomizationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? optionId = null,Object? quantity = null,}) {
  return _then(_OrderCustomizationRequest(
optionId: null == optionId ? _self.optionId : optionId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Order {

 String get id;@JsonKey(name: 'table_id') String get tableId; OrderStatus get status;@JsonKey(name: 'estimated_time') int? get estimatedTime;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderCopyWith<Order> get copyWith => _$OrderCopyWithImpl<Order>(this as Order, _$identity);

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Order&&(identical(other.id, id) || other.id == id)&&(identical(other.tableId, tableId) || other.tableId == tableId)&&(identical(other.status, status) || other.status == status)&&(identical(other.estimatedTime, estimatedTime) || other.estimatedTime == estimatedTime)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tableId,status,estimatedTime,createdAt);

@override
String toString() {
  return 'Order(id: $id, tableId: $tableId, status: $status, estimatedTime: $estimatedTime, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $OrderCopyWith<$Res>  {
  factory $OrderCopyWith(Order value, $Res Function(Order) _then) = _$OrderCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'table_id') String tableId, OrderStatus status,@JsonKey(name: 'estimated_time') int? estimatedTime,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$OrderCopyWithImpl<$Res>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._self, this._then);

  final Order _self;
  final $Res Function(Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tableId = null,Object? status = null,Object? estimatedTime = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tableId: null == tableId ? _self.tableId : tableId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,estimatedTime: freezed == estimatedTime ? _self.estimatedTime : estimatedTime // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Order].
extension OrderPatterns on Order {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Order value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Order value)  $default,){
final _that = this;
switch (_that) {
case _Order():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Order value)?  $default,){
final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'table_id')  String tableId,  OrderStatus status, @JsonKey(name: 'estimated_time')  int? estimatedTime, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.tableId,_that.status,_that.estimatedTime,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'table_id')  String tableId,  OrderStatus status, @JsonKey(name: 'estimated_time')  int? estimatedTime, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _Order():
return $default(_that.id,_that.tableId,_that.status,_that.estimatedTime,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'table_id')  String tableId,  OrderStatus status, @JsonKey(name: 'estimated_time')  int? estimatedTime, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.tableId,_that.status,_that.estimatedTime,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Order implements Order {
  const _Order({required this.id, @JsonKey(name: 'table_id') required this.tableId, required this.status, @JsonKey(name: 'estimated_time') this.estimatedTime, @JsonKey(name: 'created_at') required this.createdAt});
  factory _Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

@override final  String id;
@override@JsonKey(name: 'table_id') final  String tableId;
@override final  OrderStatus status;
@override@JsonKey(name: 'estimated_time') final  int? estimatedTime;
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCopyWith<_Order> get copyWith => __$OrderCopyWithImpl<_Order>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Order&&(identical(other.id, id) || other.id == id)&&(identical(other.tableId, tableId) || other.tableId == tableId)&&(identical(other.status, status) || other.status == status)&&(identical(other.estimatedTime, estimatedTime) || other.estimatedTime == estimatedTime)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tableId,status,estimatedTime,createdAt);

@override
String toString() {
  return 'Order(id: $id, tableId: $tableId, status: $status, estimatedTime: $estimatedTime, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$OrderCopyWith(_Order value, $Res Function(_Order) _then) = __$OrderCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'table_id') String tableId, OrderStatus status,@JsonKey(name: 'estimated_time') int? estimatedTime,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$OrderCopyWithImpl<$Res>
    implements _$OrderCopyWith<$Res> {
  __$OrderCopyWithImpl(this._self, this._then);

  final _Order _self;
  final $Res Function(_Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tableId = null,Object? status = null,Object? estimatedTime = freezed,Object? createdAt = null,}) {
  return _then(_Order(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tableId: null == tableId ? _self.tableId : tableId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,estimatedTime: freezed == estimatedTime ? _self.estimatedTime : estimatedTime // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
