import 'package:freezed_annotation/freezed_annotation.dart';

import '../address/address.dart';
import '../product/products.dart';
part 'orders.freezed.dart';
part 'orders.g.dart';

List<Orders> ordersFromJson(dynamic str) =>
    List<Orders>.from((str).map((e) => Orders.fromJson(e)));

@freezed
abstract class Orders with _$Orders {
  factory Orders(
      {required String OrderId,
      required Address Addres,
      required int TotalAmount,
      required DateTime Date,
      required String OrderStatus,
      required List<Map<String, dynamic>> OrderDetails}) = _Order;

  factory Orders.fromJson(Map<String, dynamic> json) => _$OrdersFromJson(json);
}
