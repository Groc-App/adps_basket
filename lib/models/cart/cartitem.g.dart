// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartitem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartItem _$$_CartItemFromJson(Map<String, dynamic> json) => _$_CartItem(
      Item: ProductItem.fromJson(json['Item'] as Map<String, dynamic>),
      ItemCount: json['ItemCount'] as int,
    );

Map<String, dynamic> _$$_CartItemToJson(_$_CartItem instance) =>
    <String, dynamic>{
      'Item': instance.Item,
      'ItemCount': instance.ItemCount,
    };
