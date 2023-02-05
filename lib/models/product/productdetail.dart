import 'package:freezed_annotation/freezed_annotation.dart';
part 'productdetail.freezed.dart';
part 'productdetail.g.dart';

ProductItem productDetailFromJson(dynamic str) => ProductItem.fromJson(str);

@freezed
abstract class ProductItem with _$ProductItem {
  factory ProductItem({
    required String Name,
    required String Price,
    required String Description,
    required String Quantity,
    required String Company,
    required String ImageUrl,
  }) = _ProductItem;

  factory ProductItem.fromJson(Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);
}
