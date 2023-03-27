// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
part 'address.freezed.dart';
part 'address.g.dart';

List<Address> addressFromJson(dynamic str) =>
    List<Address>.from((str).map((e) => Address.fromJson(e)));

@freezed
abstract class Address with _$Address {
  factory Address(
      {required String addressId,
      required bool defaultAddress,
      required String Flat_FLoor_Tower,
      required String Street_Society,
      required String Recipients_Name,
      required String City,
      required String Pincode}) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
