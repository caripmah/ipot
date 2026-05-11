// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartItem {

 String get id;// uuid: "${menuItem.id}_${selectedOptions.hashCode}"
 MenuItem get menuItem; int get quantity; List<SelectedOption> get selectedOptions; String? get note;
/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartItemCopyWith<CartItem> get copyWith => _$CartItemCopyWithImpl<CartItem>(this as CartItem, _$identity);

  /// Serializes this CartItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartItem&&(identical(other.id, id) || other.id == id)&&(identical(other.menuItem, menuItem) || other.menuItem == menuItem)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&const DeepCollectionEquality().equals(other.selectedOptions, selectedOptions)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,menuItem,quantity,const DeepCollectionEquality().hash(selectedOptions),note);

@override
String toString() {
  return 'CartItem(id: $id, menuItem: $menuItem, quantity: $quantity, selectedOptions: $selectedOptions, note: $note)';
}


}

/// @nodoc
abstract mixin class $CartItemCopyWith<$Res>  {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) _then) = _$CartItemCopyWithImpl;
@useResult
$Res call({
 String id, MenuItem menuItem, int quantity, List<SelectedOption> selectedOptions, String? note
});


$MenuItemCopyWith<$Res> get menuItem;

}
/// @nodoc
class _$CartItemCopyWithImpl<$Res>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._self, this._then);

  final CartItem _self;
  final $Res Function(CartItem) _then;

/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? menuItem = null,Object? quantity = null,Object? selectedOptions = null,Object? note = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,menuItem: null == menuItem ? _self.menuItem : menuItem // ignore: cast_nullable_to_non_nullable
as MenuItem,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,selectedOptions: null == selectedOptions ? _self.selectedOptions : selectedOptions // ignore: cast_nullable_to_non_nullable
as List<SelectedOption>,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuItemCopyWith<$Res> get menuItem {
  
  return $MenuItemCopyWith<$Res>(_self.menuItem, (value) {
    return _then(_self.copyWith(menuItem: value));
  });
}
}


/// Adds pattern-matching-related methods to [CartItem].
extension CartItemPatterns on CartItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartItem value)  $default,){
final _that = this;
switch (_that) {
case _CartItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartItem value)?  $default,){
final _that = this;
switch (_that) {
case _CartItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  MenuItem menuItem,  int quantity,  List<SelectedOption> selectedOptions,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartItem() when $default != null:
return $default(_that.id,_that.menuItem,_that.quantity,_that.selectedOptions,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  MenuItem menuItem,  int quantity,  List<SelectedOption> selectedOptions,  String? note)  $default,) {final _that = this;
switch (_that) {
case _CartItem():
return $default(_that.id,_that.menuItem,_that.quantity,_that.selectedOptions,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  MenuItem menuItem,  int quantity,  List<SelectedOption> selectedOptions,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _CartItem() when $default != null:
return $default(_that.id,_that.menuItem,_that.quantity,_that.selectedOptions,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartItem extends CartItem {
  const _CartItem({required this.id, required this.menuItem, required this.quantity, final  List<SelectedOption> selectedOptions = const [], this.note}): _selectedOptions = selectedOptions,super._();
  factory _CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);

@override final  String id;
// uuid: "${menuItem.id}_${selectedOptions.hashCode}"
@override final  MenuItem menuItem;
@override final  int quantity;
 final  List<SelectedOption> _selectedOptions;
@override@JsonKey() List<SelectedOption> get selectedOptions {
  if (_selectedOptions is EqualUnmodifiableListView) return _selectedOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedOptions);
}

@override final  String? note;

/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartItemCopyWith<_CartItem> get copyWith => __$CartItemCopyWithImpl<_CartItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartItem&&(identical(other.id, id) || other.id == id)&&(identical(other.menuItem, menuItem) || other.menuItem == menuItem)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&const DeepCollectionEquality().equals(other._selectedOptions, _selectedOptions)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,menuItem,quantity,const DeepCollectionEquality().hash(_selectedOptions),note);

@override
String toString() {
  return 'CartItem(id: $id, menuItem: $menuItem, quantity: $quantity, selectedOptions: $selectedOptions, note: $note)';
}


}

/// @nodoc
abstract mixin class _$CartItemCopyWith<$Res> implements $CartItemCopyWith<$Res> {
  factory _$CartItemCopyWith(_CartItem value, $Res Function(_CartItem) _then) = __$CartItemCopyWithImpl;
@override @useResult
$Res call({
 String id, MenuItem menuItem, int quantity, List<SelectedOption> selectedOptions, String? note
});


@override $MenuItemCopyWith<$Res> get menuItem;

}
/// @nodoc
class __$CartItemCopyWithImpl<$Res>
    implements _$CartItemCopyWith<$Res> {
  __$CartItemCopyWithImpl(this._self, this._then);

  final _CartItem _self;
  final $Res Function(_CartItem) _then;

/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? menuItem = null,Object? quantity = null,Object? selectedOptions = null,Object? note = freezed,}) {
  return _then(_CartItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,menuItem: null == menuItem ? _self.menuItem : menuItem // ignore: cast_nullable_to_non_nullable
as MenuItem,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,selectedOptions: null == selectedOptions ? _self._selectedOptions : selectedOptions // ignore: cast_nullable_to_non_nullable
as List<SelectedOption>,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuItemCopyWith<$Res> get menuItem {
  
  return $MenuItemCopyWith<$Res>(_self.menuItem, (value) {
    return _then(_self.copyWith(menuItem: value));
  });
}
}


/// @nodoc
mixin _$SelectedOption {

 int get groupId; CustomizationOption get option;
/// Create a copy of SelectedOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectedOptionCopyWith<SelectedOption> get copyWith => _$SelectedOptionCopyWithImpl<SelectedOption>(this as SelectedOption, _$identity);

  /// Serializes this SelectedOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectedOption&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.option, option) || other.option == option));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupId,option);

@override
String toString() {
  return 'SelectedOption(groupId: $groupId, option: $option)';
}


}

/// @nodoc
abstract mixin class $SelectedOptionCopyWith<$Res>  {
  factory $SelectedOptionCopyWith(SelectedOption value, $Res Function(SelectedOption) _then) = _$SelectedOptionCopyWithImpl;
@useResult
$Res call({
 int groupId, CustomizationOption option
});


$CustomizationOptionCopyWith<$Res> get option;

}
/// @nodoc
class _$SelectedOptionCopyWithImpl<$Res>
    implements $SelectedOptionCopyWith<$Res> {
  _$SelectedOptionCopyWithImpl(this._self, this._then);

  final SelectedOption _self;
  final $Res Function(SelectedOption) _then;

/// Create a copy of SelectedOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groupId = null,Object? option = null,}) {
  return _then(_self.copyWith(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,option: null == option ? _self.option : option // ignore: cast_nullable_to_non_nullable
as CustomizationOption,
  ));
}
/// Create a copy of SelectedOption
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomizationOptionCopyWith<$Res> get option {
  
  return $CustomizationOptionCopyWith<$Res>(_self.option, (value) {
    return _then(_self.copyWith(option: value));
  });
}
}


/// Adds pattern-matching-related methods to [SelectedOption].
extension SelectedOptionPatterns on SelectedOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SelectedOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SelectedOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SelectedOption value)  $default,){
final _that = this;
switch (_that) {
case _SelectedOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SelectedOption value)?  $default,){
final _that = this;
switch (_that) {
case _SelectedOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int groupId,  CustomizationOption option)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SelectedOption() when $default != null:
return $default(_that.groupId,_that.option);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int groupId,  CustomizationOption option)  $default,) {final _that = this;
switch (_that) {
case _SelectedOption():
return $default(_that.groupId,_that.option);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int groupId,  CustomizationOption option)?  $default,) {final _that = this;
switch (_that) {
case _SelectedOption() when $default != null:
return $default(_that.groupId,_that.option);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SelectedOption implements SelectedOption {
  const _SelectedOption({required this.groupId, required this.option});
  factory _SelectedOption.fromJson(Map<String, dynamic> json) => _$SelectedOptionFromJson(json);

@override final  int groupId;
@override final  CustomizationOption option;

/// Create a copy of SelectedOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectedOptionCopyWith<_SelectedOption> get copyWith => __$SelectedOptionCopyWithImpl<_SelectedOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SelectedOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectedOption&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.option, option) || other.option == option));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,groupId,option);

@override
String toString() {
  return 'SelectedOption(groupId: $groupId, option: $option)';
}


}

/// @nodoc
abstract mixin class _$SelectedOptionCopyWith<$Res> implements $SelectedOptionCopyWith<$Res> {
  factory _$SelectedOptionCopyWith(_SelectedOption value, $Res Function(_SelectedOption) _then) = __$SelectedOptionCopyWithImpl;
@override @useResult
$Res call({
 int groupId, CustomizationOption option
});


@override $CustomizationOptionCopyWith<$Res> get option;

}
/// @nodoc
class __$SelectedOptionCopyWithImpl<$Res>
    implements _$SelectedOptionCopyWith<$Res> {
  __$SelectedOptionCopyWithImpl(this._self, this._then);

  final _SelectedOption _self;
  final $Res Function(_SelectedOption) _then;

/// Create a copy of SelectedOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groupId = null,Object? option = null,}) {
  return _then(_SelectedOption(
groupId: null == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int,option: null == option ? _self.option : option // ignore: cast_nullable_to_non_nullable
as CustomizationOption,
  ));
}

/// Create a copy of SelectedOption
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomizationOptionCopyWith<$Res> get option {
  
  return $CustomizationOptionCopyWith<$Res>(_self.option, (value) {
    return _then(_self.copyWith(option: value));
  });
}
}

// dart format on
