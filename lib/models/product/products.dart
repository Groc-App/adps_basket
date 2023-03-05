// ignore_for_file: non_constant_identifier_names

// import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'products.freezed.dart';
part 'products.g.dart';

List<Product> productsFromJson(dynamic str) =>
    List<Product>.from((str).map((e) => Product.fromJson(e)));

@freezed
abstract class Product with _$Product {
  factory Product(
      {required String productId,
      required String Name,
      required double Price,
      required List<String> ImageUrl,
      required String Quantity,
      required String Company,
      required String Description,
      required Object MainCategory,
      required Object Category}) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
