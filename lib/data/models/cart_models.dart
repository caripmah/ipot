import 'package:freezed_annotation/freezed_annotation.dart';
import 'menu_models.dart';

part 'cart_models.freezed.dart';
part 'cart_models.g.dart';

@freezed
abstract class CartItem with _$CartItem {
  const CartItem._(); // enables custom getters

  const factory CartItem({
    required String id, // uuid: "${menuItem.id}_${selectedOptions.hashCode}"
    required MenuItem menuItem,
    required int quantity,
    @Default([]) List<SelectedOption> selectedOptions,
    String? note,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  double get itemBasePrice => menuItem.price;

  double get optionsPrice =>
      selectedOptions.fold(0.0, (sum, o) => sum + o.option.priceModifier);

  double get unitPrice => itemBasePrice + optionsPrice;

  double get totalPrice => unitPrice * quantity;
}

@freezed
abstract class SelectedOption with _$SelectedOption {
  const factory SelectedOption({
    required int groupId,
    required CustomizationOption option,
  }) = _SelectedOption;

  factory SelectedOption.fromJson(Map<String, dynamic> json) =>
      _$SelectedOptionFromJson(json);
}
