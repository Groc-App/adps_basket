import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:your_basket/models/product/productdetail.dart';

import '../product/products.dart';
part 'orders.freezed.dart';
part 'orders.g.dart';

List<Orders> ordersFromJson(dynamic str) =>
    List<Orders>.from((str).map((e) => Orders.fromJson(e)));

@freezed
abstract class Orders with _$Orders {
  factory Orders(
      {required String OrderId,
      required int TotalAmount,
      required String OrderStatus,
      required List<Object> OrderDetails}) = _Order;

  factory Orders.fromJson(Map<String, dynamic> json) => _$OrdersFromJson(json);
}
