import 'package:freezed_annotation/freezed_annotation.dart';
part 'productdetail.freezed.dart';
part 'productdetail.g.dart';

ProductItem productDetailFromJson(dynamic str) => ProductItem.fromJson(str);

@freezed
abstract class ProductItem with _$ProductItem {
  factory ProductItem(
      {required String productId,
      required String Name,
      required double Price,
      required String ImageUrl,
      required String Quantity,
      required String Company,
      required String Description,
      required Object MainCategory,
      required Object Category}) = _ProductItem;

  factory ProductItem.fromJson(Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);
}
