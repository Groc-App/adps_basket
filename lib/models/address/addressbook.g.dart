// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'addressbook.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddressBook _$$_AddressBookFromJson(Map<String, dynamic> json) =>
    _$_AddressBook(
      addresses: (json['addresses'] as List<dynamic>)
          .map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AddressBookToJson(_$_AddressBook instance) =>
    <String, dynamic>{
      'addresses': instance.addresses,
    };
