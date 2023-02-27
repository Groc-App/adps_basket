// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Offer _$$_OfferFromJson(Map<String, dynamic> json) => _$_Offer(
      offerId: json['offerId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      isUserClaimed: json['isUserClaimed'] as bool,
      worth: (json['worth'] as num).toDouble(),
      number: (json['number'] as num).toDouble(),
    );

Map<String, dynamic> _$$_OfferToJson(_$_Offer instance) => <String, dynamic>{
      'offerId': instance.offerId,
      'name': instance.name,
      'description': instance.description,
      'isUserClaimed': instance.isUserClaimed,
      'worth': instance.worth,
      'number': instance.number,
    };
