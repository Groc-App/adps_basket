// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$$_OrderFromJson(Map<String, dynamic> json) => _$_Order(
      OrderId: json['OrderId'] as String,
      Addres: Address.fromJson(json['Addres'] as Map<String, dynamic>),
      TotalAmount: json['TotalAmount'] as int,
      Date: DateTime.parse(json['Date'] as String),
      OrderStatus: json['OrderStatus'] as String,
      OrderDetails: (json['OrderDetails'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'OrderId': instance.OrderId,
      'Addres': instance.Addres,
      'TotalAmount': instance.TotalAmount,
      'Date': instance.Date.toIso8601String(),
      'OrderStatus': instance.OrderStatus,
      'OrderDetails': instance.OrderDetails,
    };
