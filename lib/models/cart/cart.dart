// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:your_basket/models/cart/cartitem.dart';
// import './cartitem.dart' as CartItem;

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
abstract class Cart with _$Cart {
  factory Cart({
    required String Number,
    required List<CartItem> products,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}
