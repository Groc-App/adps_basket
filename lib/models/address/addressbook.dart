// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:your_basket/models/address/address.dart';
// import './cartitem.dart' as CartItem;

part 'addressbook.freezed.dart';
part 'addressbook.g.dart';

@freezed
abstract class AddressBook with _$AddressBook {
  factory AddressBook({
    required List<Address> addresses,
  }) = _AddressBook;

  factory AddressBook.fromJson(Map<String, dynamic> json) =>
      _$AddressBookFromJson(json);
}
