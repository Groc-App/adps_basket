// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$$_OrderFromJson(Map<String, dynamic> json) => _$_Order(
      OrderId: json['OrderId'] as String,
      Address: json['Address'] as String,
      TotalAmount: json['TotalAmount'] as int,
      Date: DateTime.parse(json['Date'] as String),
      OrderStatus: json['OrderStatus'] as String,
      OrderDetails: (json['OrderDetails'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'OrderId': instance.OrderId,
      'Address': instance.Address,
      'TotalAmount': instance.TotalAmount,
      'Date': instance.Date.toIso8601String(),
      'OrderStatus': instance.OrderStatus,
      'OrderDetails': instance.OrderDetails,
    };
