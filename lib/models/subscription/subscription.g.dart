// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Subscription _$$_SubscriptionFromJson(Map<String, dynamic> json) =>
    _$_Subscription(
      product: ProductItem.fromJson(json['product'] as Map<String, dynamic>),
      address: Map<String, String>.from(json['address'] as Map),
      quantity: json['quantity'] as int,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      subscriptionStatus: json['subscriptionStatus'] as bool,
      subscriptionId: json['subscriptionId'] as String,
    );

Map<String, dynamic> _$$_SubscriptionToJson(_$_Subscription instance) =>
    <String, dynamic>{
      'product': instance.product,
      'address': instance.address,
      'quantity': instance.quantity,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'subscriptionStatus': instance.subscriptionStatus,
      'subscriptionId': instance.subscriptionId,
    };
