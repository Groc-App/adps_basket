import 'package:freezed_annotation/freezed_annotation.dart';
part 'productdetail.freezed.dart';
part 'productdetail.g.dart';

Product productDetailFromJson(dynamic str) => Product.fromJson(str);

@freezed
abstract class Product with _$Product {
  factory Product({
    required String Name,
    required String Price,
    required String Description,
    required String Quantity,
    required String Company,
    required String ImageUrl,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
