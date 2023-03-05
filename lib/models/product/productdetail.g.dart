// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productdetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductItem _$$_ProductItemFromJson(Map<String, dynamic> json) =>
    _$_ProductItem(
      productId: json['productId'] as String,
      Name: json['Name'] as String,
      Price: (json['Price'] as num).toDouble(),
      ImageUrl:
          (json['ImageUrl'] as List<dynamic>).map((e) => e as String).toList(),
      Quantity: json['Quantity'] as String,
      Company: json['Company'] as String,
      Description: json['Description'] as String,
      MainCategory: json['MainCategory'] as Object,
      Category: json['Category'] as Object,
    );

Map<String, dynamic> _$$_ProductItemToJson(_$_ProductItem instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'Name': instance.Name,
      'Price': instance.Price,
      'ImageUrl': instance.ImageUrl,
      'Quantity': instance.Quantity,
      'Company': instance.Company,
      'Description': instance.Description,
      'MainCategory': instance.MainCategory,
      'Category': instance.Category,
    };
