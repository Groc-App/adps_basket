import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:your_basket/models/cart/cartitem.dart';
// import './cartitem.dart' as CartItem;

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
abstract class Cart with _$Cart {
  const factory Cart({
    required String Number,
    required List<CartItem> CartItem,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

// extension CartExt on Cart{
//   double get grandTotal{
//     return CartItem.map((e) => )
//   }
// }