import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:your_basket/models/product/productdetail.dart';
part 'cartitem.freezed.dart';
part 'cartitem.g.dart';

List<CartItem> cartitemFromJson(dynamic str) =>
    List<CartItem>.from((str).map((e) => CartItem.fromJson(e)));

@freezed
abstract class CartItem with _$CartItem {
  factory CartItem({required ProductItem Item, required int ItemCount}) =
      _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}
