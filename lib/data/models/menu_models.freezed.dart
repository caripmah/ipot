// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MenuResponse {

 Restaurant get restaurant; List<Category> get categories; List<MenuItem> get items;
/// Create a copy of MenuResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuResponseCopyWith<MenuResponse> get copyWith => _$MenuResponseCopyWithImpl<MenuResponse>(this as MenuResponse, _$identity);

  /// Serializes this MenuResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuResponse&&(identical(other.restaurant, restaurant) || other.restaurant == restaurant)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,restaurant,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'MenuResponse(restaurant: $restaurant, categories: $categories, items: $items)';
}


}

/// @nodoc
abstract mixin class $MenuResponseCopyWith<$Res>  {
  factory $MenuResponseCopyWith(MenuResponse value, $Res Function(MenuResponse) _then) = _$MenuResponseCopyWithImpl;
@useResult
$Res call({
 Restaurant restaurant, List<Category> categories, List<MenuItem> items
});


$RestaurantCopyWith<$Res> get restaurant;

}
/// @nodoc
class _$MenuResponseCopyWithImpl<$Res>
    implements $MenuResponseCopyWith<$Res> {
  _$MenuResponseCopyWithImpl(this._self, this._then);

  final MenuResponse _self;
  final $Res Function(MenuResponse) _then;

/// Create a copy of MenuResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? restaurant = null,Object? categories = null,Object? items = null,}) {
  return _then(_self.copyWith(
restaurant: null == restaurant ? _self.restaurant : restaurant // ignore: cast_nullable_to_non_nullable
as Restaurant,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<Category>,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<MenuItem>,
  ));
}
/// Create a copy of MenuResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RestaurantCopyWith<$Res> get restaurant {
  
  return $RestaurantCopyWith<$Res>(_self.restaurant, (value) {
    return _then(_self.copyWith(restaurant: value));
  });
}
}


/// Adds pattern-matching-related methods to [MenuResponse].
extension MenuResponsePatterns on MenuResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuResponse value)  $default,){
final _that = this;
switch (_that) {
case _MenuResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MenuResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Restaurant restaurant,  List<Category> categories,  List<MenuItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuResponse() when $default != null:
return $default(_that.restaurant,_that.categories,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Restaurant restaurant,  List<Category> categories,  List<MenuItem> items)  $default,) {final _that = this;
switch (_that) {
case _MenuResponse():
return $default(_that.restaurant,_that.categories,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Restaurant restaurant,  List<Category> categories,  List<MenuItem> items)?  $default,) {final _that = this;
switch (_that) {
case _MenuResponse() when $default != null:
return $default(_that.restaurant,_that.categories,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuResponse implements MenuResponse {
  const _MenuResponse({required this.restaurant, required final  List<Category> categories, required final  List<MenuItem> items}): _categories = categories,_items = items;
  factory _MenuResponse.fromJson(Map<String, dynamic> json) => _$MenuResponseFromJson(json);

@override final  Restaurant restaurant;
 final  List<Category> _categories;
@override List<Category> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<MenuItem> _items;
@override List<MenuItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of MenuResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuResponseCopyWith<_MenuResponse> get copyWith => __$MenuResponseCopyWithImpl<_MenuResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuResponse&&(identical(other.restaurant, restaurant) || other.restaurant == restaurant)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,restaurant,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'MenuResponse(restaurant: $restaurant, categories: $categories, items: $items)';
}


}

/// @nodoc
abstract mixin class _$MenuResponseCopyWith<$Res> implements $MenuResponseCopyWith<$Res> {
  factory _$MenuResponseCopyWith(_MenuResponse value, $Res Function(_MenuResponse) _then) = __$MenuResponseCopyWithImpl;
@override @useResult
$Res call({
 Restaurant restaurant, List<Category> categories, List<MenuItem> items
});


@override $RestaurantCopyWith<$Res> get restaurant;

}
/// @nodoc
class __$MenuResponseCopyWithImpl<$Res>
    implements _$MenuResponseCopyWith<$Res> {
  __$MenuResponseCopyWithImpl(this._self, this._then);

  final _MenuResponse _self;
  final $Res Function(_MenuResponse) _then;

/// Create a copy of MenuResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? restaurant = null,Object? categories = null,Object? items = null,}) {
  return _then(_MenuResponse(
restaurant: null == restaurant ? _self.restaurant : restaurant // ignore: cast_nullable_to_non_nullable
as Restaurant,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<Category>,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<MenuItem>,
  ));
}

/// Create a copy of MenuResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RestaurantCopyWith<$Res> get restaurant {
  
  return $RestaurantCopyWith<$Res>(_self.restaurant, (value) {
    return _then(_self.copyWith(restaurant: value));
  });
}
}


/// @nodoc
mixin _$Restaurant {

 String get id; String get name;@JsonKey(name: 'table_id') String get tableId;
/// Create a copy of Restaurant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RestaurantCopyWith<Restaurant> get copyWith => _$RestaurantCopyWithImpl<Restaurant>(this as Restaurant, _$identity);

  /// Serializes this Restaurant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Restaurant&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.tableId, tableId) || other.tableId == tableId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,tableId);

@override
String toString() {
  return 'Restaurant(id: $id, name: $name, tableId: $tableId)';
}


}

/// @nodoc
abstract mixin class $RestaurantCopyWith<$Res>  {
  factory $RestaurantCopyWith(Restaurant value, $Res Function(Restaurant) _then) = _$RestaurantCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(name: 'table_id') String tableId
});




}
/// @nodoc
class _$RestaurantCopyWithImpl<$Res>
    implements $RestaurantCopyWith<$Res> {
  _$RestaurantCopyWithImpl(this._self, this._then);

  final Restaurant _self;
  final $Res Function(Restaurant) _then;

/// Create a copy of Restaurant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? tableId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tableId: null == tableId ? _self.tableId : tableId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Restaurant].
extension RestaurantPatterns on Restaurant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Restaurant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Restaurant() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Restaurant value)  $default,){
final _that = this;
switch (_that) {
case _Restaurant():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Restaurant value)?  $default,){
final _that = this;
switch (_that) {
case _Restaurant() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'table_id')  String tableId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Restaurant() when $default != null:
return $default(_that.id,_that.name,_that.tableId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'table_id')  String tableId)  $default,) {final _that = this;
switch (_that) {
case _Restaurant():
return $default(_that.id,_that.name,_that.tableId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(name: 'table_id')  String tableId)?  $default,) {final _that = this;
switch (_that) {
case _Restaurant() when $default != null:
return $default(_that.id,_that.name,_that.tableId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Restaurant implements Restaurant {
  const _Restaurant({required this.id, required this.name, @JsonKey(name: 'table_id') required this.tableId});
  factory _Restaurant.fromJson(Map<String, dynamic> json) => _$RestaurantFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(name: 'table_id') final  String tableId;

/// Create a copy of Restaurant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RestaurantCopyWith<_Restaurant> get copyWith => __$RestaurantCopyWithImpl<_Restaurant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RestaurantToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Restaurant&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.tableId, tableId) || other.tableId == tableId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,tableId);

@override
String toString() {
  return 'Restaurant(id: $id, name: $name, tableId: $tableId)';
}


}

/// @nodoc
abstract mixin class _$RestaurantCopyWith<$Res> implements $RestaurantCopyWith<$Res> {
  factory _$RestaurantCopyWith(_Restaurant value, $Res Function(_Restaurant) _then) = __$RestaurantCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(name: 'table_id') String tableId
});




}
/// @nodoc
class __$RestaurantCopyWithImpl<$Res>
    implements _$RestaurantCopyWith<$Res> {
  __$RestaurantCopyWithImpl(this._self, this._then);

  final _Restaurant _self;
  final $Res Function(_Restaurant) _then;

/// Create a copy of Restaurant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? tableId = null,}) {
  return _then(_Restaurant(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tableId: null == tableId ? _self.tableId : tableId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Category {

 int get id; String get name;@JsonKey(name: 'sort_order') int get sortOrder;
/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryCopyWith<Category> get copyWith => _$CategoryCopyWithImpl<Category>(this as Category, _$identity);

  /// Serializes this Category to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Category&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,sortOrder);

@override
String toString() {
  return 'Category(id: $id, name: $name, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $CategoryCopyWith<$Res>  {
  factory $CategoryCopyWith(Category value, $Res Function(Category) _then) = _$CategoryCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'sort_order') int sortOrder
});




}
/// @nodoc
class _$CategoryCopyWithImpl<$Res>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._self, this._then);

  final Category _self;
  final $Res Function(Category) _then;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? sortOrder = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Category].
extension CategoryPatterns on Category {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Category value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Category() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Category value)  $default,){
final _that = this;
switch (_that) {
case _Category():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Category value)?  $default,){
final _that = this;
switch (_that) {
case _Category() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'sort_order')  int sortOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Category() when $default != null:
return $default(_that.id,_that.name,_that.sortOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'sort_order')  int sortOrder)  $default,) {final _that = this;
switch (_that) {
case _Category():
return $default(_that.id,_that.name,_that.sortOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'sort_order')  int sortOrder)?  $default,) {final _that = this;
switch (_that) {
case _Category() when $default != null:
return $default(_that.id,_that.name,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Category implements Category {
  const _Category({required this.id, required this.name, @JsonKey(name: 'sort_order') required this.sortOrder});
  factory _Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'sort_order') final  int sortOrder;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryCopyWith<_Category> get copyWith => __$CategoryCopyWithImpl<_Category>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Category&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,sortOrder);

@override
String toString() {
  return 'Category(id: $id, name: $name, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class _$CategoryCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory _$CategoryCopyWith(_Category value, $Res Function(_Category) _then) = __$CategoryCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'sort_order') int sortOrder
});




}
/// @nodoc
class __$CategoryCopyWithImpl<$Res>
    implements _$CategoryCopyWith<$Res> {
  __$CategoryCopyWithImpl(this._self, this._then);

  final _Category _self;
  final $Res Function(_Category) _then;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? sortOrder = null,}) {
  return _then(_Category(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$MenuItem {

 int get id; String get name; String get description; double get price;@JsonKey(name: 'category_id') int get categoryId;@JsonKey(name: 'image_url') String? get imageUrl;@JsonKey(name: 'customization_groups') List<CustomizationGroup> get customizationGroups;
/// Create a copy of MenuItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuItemCopyWith<MenuItem> get copyWith => _$MenuItemCopyWithImpl<MenuItem>(this as MenuItem, _$identity);

  /// Serializes this MenuItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other.customizationGroups, customizationGroups));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price,categoryId,imageUrl,const DeepCollectionEquality().hash(customizationGroups));

@override
String toString() {
  return 'MenuItem(id: $id, name: $name, description: $description, price: $price, categoryId: $categoryId, imageUrl: $imageUrl, customizationGroups: $customizationGroups)';
}


}

/// @nodoc
abstract mixin class $MenuItemCopyWith<$Res>  {
  factory $MenuItemCopyWith(MenuItem value, $Res Function(MenuItem) _then) = _$MenuItemCopyWithImpl;
@useResult
$Res call({
 int id, String name, String description, double price,@JsonKey(name: 'category_id') int categoryId,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'customization_groups') List<CustomizationGroup> customizationGroups
});




}
/// @nodoc
class _$MenuItemCopyWithImpl<$Res>
    implements $MenuItemCopyWith<$Res> {
  _$MenuItemCopyWithImpl(this._self, this._then);

  final MenuItem _self;
  final $Res Function(MenuItem) _then;

/// Create a copy of MenuItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? price = null,Object? categoryId = null,Object? imageUrl = freezed,Object? customizationGroups = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,customizationGroups: null == customizationGroups ? _self.customizationGroups : customizationGroups // ignore: cast_nullable_to_non_nullable
as List<CustomizationGroup>,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuItem].
extension MenuItemPatterns on MenuItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuItem value)  $default,){
final _that = this;
switch (_that) {
case _MenuItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuItem value)?  $default,){
final _that = this;
switch (_that) {
case _MenuItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String description,  double price, @JsonKey(name: 'category_id')  int categoryId, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'customization_groups')  List<CustomizationGroup> customizationGroups)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuItem() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.price,_that.categoryId,_that.imageUrl,_that.customizationGroups);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String description,  double price, @JsonKey(name: 'category_id')  int categoryId, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'customization_groups')  List<CustomizationGroup> customizationGroups)  $default,) {final _that = this;
switch (_that) {
case _MenuItem():
return $default(_that.id,_that.name,_that.description,_that.price,_that.categoryId,_that.imageUrl,_that.customizationGroups);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String description,  double price, @JsonKey(name: 'category_id')  int categoryId, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'customization_groups')  List<CustomizationGroup> customizationGroups)?  $default,) {final _that = this;
switch (_that) {
case _MenuItem() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.price,_that.categoryId,_that.imageUrl,_that.customizationGroups);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuItem implements MenuItem {
  const _MenuItem({required this.id, required this.name, required this.description, required this.price, @JsonKey(name: 'category_id') required this.categoryId, @JsonKey(name: 'image_url') this.imageUrl, @JsonKey(name: 'customization_groups') final  List<CustomizationGroup> customizationGroups = const []}): _customizationGroups = customizationGroups;
  factory _MenuItem.fromJson(Map<String, dynamic> json) => _$MenuItemFromJson(json);

@override final  int id;
@override final  String name;
@override final  String description;
@override final  double price;
@override@JsonKey(name: 'category_id') final  int categoryId;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
 final  List<CustomizationGroup> _customizationGroups;
@override@JsonKey(name: 'customization_groups') List<CustomizationGroup> get customizationGroups {
  if (_customizationGroups is EqualUnmodifiableListView) return _customizationGroups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_customizationGroups);
}


/// Create a copy of MenuItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuItemCopyWith<_MenuItem> get copyWith => __$MenuItemCopyWithImpl<_MenuItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other._customizationGroups, _customizationGroups));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price,categoryId,imageUrl,const DeepCollectionEquality().hash(_customizationGroups));

@override
String toString() {
  return 'MenuItem(id: $id, name: $name, description: $description, price: $price, categoryId: $categoryId, imageUrl: $imageUrl, customizationGroups: $customizationGroups)';
}


}

/// @nodoc
abstract mixin class _$MenuItemCopyWith<$Res> implements $MenuItemCopyWith<$Res> {
  factory _$MenuItemCopyWith(_MenuItem value, $Res Function(_MenuItem) _then) = __$MenuItemCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String description, double price,@JsonKey(name: 'category_id') int categoryId,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'customization_groups') List<CustomizationGroup> customizationGroups
});




}
/// @nodoc
class __$MenuItemCopyWithImpl<$Res>
    implements _$MenuItemCopyWith<$Res> {
  __$MenuItemCopyWithImpl(this._self, this._then);

  final _MenuItem _self;
  final $Res Function(_MenuItem) _then;

/// Create a copy of MenuItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? price = null,Object? categoryId = null,Object? imageUrl = freezed,Object? customizationGroups = null,}) {
  return _then(_MenuItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,customizationGroups: null == customizationGroups ? _self._customizationGroups : customizationGroups // ignore: cast_nullable_to_non_nullable
as List<CustomizationGroup>,
  ));
}


}


/// @nodoc
mixin _$CustomizationGroup {

 int get id; String get name; bool get required;@JsonKey(name: 'max_selections') int get maxSelections; List<CustomizationOption> get options;
/// Create a copy of CustomizationGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomizationGroupCopyWith<CustomizationGroup> get copyWith => _$CustomizationGroupCopyWithImpl<CustomizationGroup>(this as CustomizationGroup, _$identity);

  /// Serializes this CustomizationGroup to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomizationGroup&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.required, required) || other.required == required)&&(identical(other.maxSelections, maxSelections) || other.maxSelections == maxSelections)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,required,maxSelections,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'CustomizationGroup(id: $id, name: $name, required: $required, maxSelections: $maxSelections, options: $options)';
}


}

/// @nodoc
abstract mixin class $CustomizationGroupCopyWith<$Res>  {
  factory $CustomizationGroupCopyWith(CustomizationGroup value, $Res Function(CustomizationGroup) _then) = _$CustomizationGroupCopyWithImpl;
@useResult
$Res call({
 int id, String name, bool required,@JsonKey(name: 'max_selections') int maxSelections, List<CustomizationOption> options
});




}
/// @nodoc
class _$CustomizationGroupCopyWithImpl<$Res>
    implements $CustomizationGroupCopyWith<$Res> {
  _$CustomizationGroupCopyWithImpl(this._self, this._then);

  final CustomizationGroup _self;
  final $Res Function(CustomizationGroup) _then;

/// Create a copy of CustomizationGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? required = null,Object? maxSelections = null,Object? options = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,required: null == required ? _self.required : required // ignore: cast_nullable_to_non_nullable
as bool,maxSelections: null == maxSelections ? _self.maxSelections : maxSelections // ignore: cast_nullable_to_non_nullable
as int,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<CustomizationOption>,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomizationGroup].
extension CustomizationGroupPatterns on CustomizationGroup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomizationGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomizationGroup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomizationGroup value)  $default,){
final _that = this;
switch (_that) {
case _CustomizationGroup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomizationGroup value)?  $default,){
final _that = this;
switch (_that) {
case _CustomizationGroup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  bool required, @JsonKey(name: 'max_selections')  int maxSelections,  List<CustomizationOption> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomizationGroup() when $default != null:
return $default(_that.id,_that.name,_that.required,_that.maxSelections,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  bool required, @JsonKey(name: 'max_selections')  int maxSelections,  List<CustomizationOption> options)  $default,) {final _that = this;
switch (_that) {
case _CustomizationGroup():
return $default(_that.id,_that.name,_that.required,_that.maxSelections,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  bool required, @JsonKey(name: 'max_selections')  int maxSelections,  List<CustomizationOption> options)?  $default,) {final _that = this;
switch (_that) {
case _CustomizationGroup() when $default != null:
return $default(_that.id,_that.name,_that.required,_that.maxSelections,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomizationGroup implements CustomizationGroup {
  const _CustomizationGroup({required this.id, required this.name, required this.required, @JsonKey(name: 'max_selections') required this.maxSelections, required final  List<CustomizationOption> options}): _options = options;
  factory _CustomizationGroup.fromJson(Map<String, dynamic> json) => _$CustomizationGroupFromJson(json);

@override final  int id;
@override final  String name;
@override final  bool required;
@override@JsonKey(name: 'max_selections') final  int maxSelections;
 final  List<CustomizationOption> _options;
@override List<CustomizationOption> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


/// Create a copy of CustomizationGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomizationGroupCopyWith<_CustomizationGroup> get copyWith => __$CustomizationGroupCopyWithImpl<_CustomizationGroup>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomizationGroupToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomizationGroup&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.required, required) || other.required == required)&&(identical(other.maxSelections, maxSelections) || other.maxSelections == maxSelections)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,required,maxSelections,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'CustomizationGroup(id: $id, name: $name, required: $required, maxSelections: $maxSelections, options: $options)';
}


}

/// @nodoc
abstract mixin class _$CustomizationGroupCopyWith<$Res> implements $CustomizationGroupCopyWith<$Res> {
  factory _$CustomizationGroupCopyWith(_CustomizationGroup value, $Res Function(_CustomizationGroup) _then) = __$CustomizationGroupCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, bool required,@JsonKey(name: 'max_selections') int maxSelections, List<CustomizationOption> options
});




}
/// @nodoc
class __$CustomizationGroupCopyWithImpl<$Res>
    implements _$CustomizationGroupCopyWith<$Res> {
  __$CustomizationGroupCopyWithImpl(this._self, this._then);

  final _CustomizationGroup _self;
  final $Res Function(_CustomizationGroup) _then;

/// Create a copy of CustomizationGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? required = null,Object? maxSelections = null,Object? options = null,}) {
  return _then(_CustomizationGroup(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,required: null == required ? _self.required : required // ignore: cast_nullable_to_non_nullable
as bool,maxSelections: null == maxSelections ? _self.maxSelections : maxSelections // ignore: cast_nullable_to_non_nullable
as int,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<CustomizationOption>,
  ));
}


}


/// @nodoc
mixin _$CustomizationOption {

 int get id; String get name;@JsonKey(name: 'price_modifier') double get priceModifier;
/// Create a copy of CustomizationOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomizationOptionCopyWith<CustomizationOption> get copyWith => _$CustomizationOptionCopyWithImpl<CustomizationOption>(this as CustomizationOption, _$identity);

  /// Serializes this CustomizationOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomizationOption&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.priceModifier, priceModifier) || other.priceModifier == priceModifier));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,priceModifier);

@override
String toString() {
  return 'CustomizationOption(id: $id, name: $name, priceModifier: $priceModifier)';
}


}

/// @nodoc
abstract mixin class $CustomizationOptionCopyWith<$Res>  {
  factory $CustomizationOptionCopyWith(CustomizationOption value, $Res Function(CustomizationOption) _then) = _$CustomizationOptionCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'price_modifier') double priceModifier
});




}
/// @nodoc
class _$CustomizationOptionCopyWithImpl<$Res>
    implements $CustomizationOptionCopyWith<$Res> {
  _$CustomizationOptionCopyWithImpl(this._self, this._then);

  final CustomizationOption _self;
  final $Res Function(CustomizationOption) _then;

/// Create a copy of CustomizationOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? priceModifier = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,priceModifier: null == priceModifier ? _self.priceModifier : priceModifier // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomizationOption].
extension CustomizationOptionPatterns on CustomizationOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomizationOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomizationOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomizationOption value)  $default,){
final _that = this;
switch (_that) {
case _CustomizationOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomizationOption value)?  $default,){
final _that = this;
switch (_that) {
case _CustomizationOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'price_modifier')  double priceModifier)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomizationOption() when $default != null:
return $default(_that.id,_that.name,_that.priceModifier);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'price_modifier')  double priceModifier)  $default,) {final _that = this;
switch (_that) {
case _CustomizationOption():
return $default(_that.id,_that.name,_that.priceModifier);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'price_modifier')  double priceModifier)?  $default,) {final _that = this;
switch (_that) {
case _CustomizationOption() when $default != null:
return $default(_that.id,_that.name,_that.priceModifier);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomizationOption implements CustomizationOption {
  const _CustomizationOption({required this.id, required this.name, @JsonKey(name: 'price_modifier') required this.priceModifier});
  factory _CustomizationOption.fromJson(Map<String, dynamic> json) => _$CustomizationOptionFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'price_modifier') final  double priceModifier;

/// Create a copy of CustomizationOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomizationOptionCopyWith<_CustomizationOption> get copyWith => __$CustomizationOptionCopyWithImpl<_CustomizationOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomizationOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomizationOption&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.priceModifier, priceModifier) || other.priceModifier == priceModifier));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,priceModifier);

@override
String toString() {
  return 'CustomizationOption(id: $id, name: $name, priceModifier: $priceModifier)';
}


}

/// @nodoc
abstract mixin class _$CustomizationOptionCopyWith<$Res> implements $CustomizationOptionCopyWith<$Res> {
  factory _$CustomizationOptionCopyWith(_CustomizationOption value, $Res Function(_CustomizationOption) _then) = __$CustomizationOptionCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'price_modifier') double priceModifier
});




}
/// @nodoc
class __$CustomizationOptionCopyWithImpl<$Res>
    implements _$CustomizationOptionCopyWith<$Res> {
  __$CustomizationOptionCopyWithImpl(this._self, this._then);

  final _CustomizationOption _self;
  final $Res Function(_CustomizationOption) _then;

/// Create a copy of CustomizationOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? priceModifier = null,}) {
  return _then(_CustomizationOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,priceModifier: null == priceModifier ? _self.priceModifier : priceModifier // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
