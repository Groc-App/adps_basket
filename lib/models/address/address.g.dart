// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Address _$$_AddressFromJson(Map<String, dynamic> json) => _$_Address(
      addressId: json['addressId'] as String,
      defaultAddress: json['defaultAddress'] as bool,
      Flat_FLoor_Tower: json['Flat_FLoor_Tower'] as String,
      Street_Society: json['Street_Society'] as String,
      Recipients_Name: json['Recipients_Name'] as String,
      City: json['City'] as String,
      Pincode: json['Pincode'] as String,
    );

Map<String, dynamic> _$$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'addressId': instance.addressId,
      'defaultAddress': instance.defaultAddress,
      'Flat_FLoor_Tower': instance.Flat_FLoor_Tower,
      'Street_Society': instance.Street_Society,
      'Recipients_Name': instance.Recipients_Name,
      'City': instance.City,
      'Pincode': instance.Pincode,
    };
