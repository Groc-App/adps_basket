// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {
  String get addressId => throw _privateConstructorUsedError;
  bool get defaultAddress => throw _privateConstructorUsedError;
  String get Flat_FLoor_Tower => throw _privateConstructorUsedError;
  String get Street_Society => throw _privateConstructorUsedError;
  String get Recipients_Name => throw _privateConstructorUsedError;
  String get City => throw _privateConstructorUsedError;
  String get Pincode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res, Address>;
  @useResult
  $Res call(
      {String addressId,
      bool defaultAddress,
      String Flat_FLoor_Tower,
      String Street_Society,
      String Recipients_Name,
      String City,
      String Pincode});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res, $Val extends Address>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressId = null,
    Object? defaultAddress = null,
    Object? Flat_FLoor_Tower = null,
    Object? Street_Society = null,
    Object? Recipients_Name = null,
    Object? City = null,
    Object? Pincode = null,
  }) {
    return _then(_value.copyWith(
      addressId: null == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as String,
      defaultAddress: null == defaultAddress
          ? _value.defaultAddress
          : defaultAddress // ignore: cast_nullable_to_non_nullable
              as bool,
      Flat_FLoor_Tower: null == Flat_FLoor_Tower
          ? _value.Flat_FLoor_Tower
          : Flat_FLoor_Tower // ignore: cast_nullable_to_non_nullable
              as String,
      Street_Society: null == Street_Society
          ? _value.Street_Society
          : Street_Society // ignore: cast_nullable_to_non_nullable
              as String,
      Recipients_Name: null == Recipients_Name
          ? _value.Recipients_Name
          : Recipients_Name // ignore: cast_nullable_to_non_nullable
              as String,
      City: null == City
          ? _value.City
          : City // ignore: cast_nullable_to_non_nullable
              as String,
      Pincode: null == Pincode
          ? _value.Pincode
          : Pincode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$_AddressCopyWith(
          _$_Address value, $Res Function(_$_Address) then) =
      __$$_AddressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String addressId,
      bool defaultAddress,
      String Flat_FLoor_Tower,
      String Street_Society,
      String Recipients_Name,
      String City,
      String Pincode});
}

/// @nodoc
class __$$_AddressCopyWithImpl<$Res>
    extends _$AddressCopyWithImpl<$Res, _$_Address>
    implements _$$_AddressCopyWith<$Res> {
  __$$_AddressCopyWithImpl(_$_Address _value, $Res Function(_$_Address) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressId = null,
    Object? defaultAddress = null,
    Object? Flat_FLoor_Tower = null,
    Object? Street_Society = null,
    Object? Recipients_Name = null,
    Object? City = null,
    Object? Pincode = null,
  }) {
    return _then(_$_Address(
      addressId: null == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as String,
      defaultAddress: null == defaultAddress
          ? _value.defaultAddress
          : defaultAddress // ignore: cast_nullable_to_non_nullable
              as bool,
      Flat_FLoor_Tower: null == Flat_FLoor_Tower
          ? _value.Flat_FLoor_Tower
          : Flat_FLoor_Tower // ignore: cast_nullable_to_non_nullable
              as String,
      Street_Society: null == Street_Society
          ? _value.Street_Society
          : Street_Society // ignore: cast_nullable_to_non_nullable
              as String,
      Recipients_Name: null == Recipients_Name
          ? _value.Recipients_Name
          : Recipients_Name // ignore: cast_nullable_to_non_nullable
              as String,
      City: null == City
          ? _value.City
          : City // ignore: cast_nullable_to_non_nullable
              as String,
      Pincode: null == Pincode
          ? _value.Pincode
          : Pincode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Address implements _Address {
  _$_Address(
      {required this.addressId,
      required this.defaultAddress,
      required this.Flat_FLoor_Tower,
      required this.Street_Society,
      required this.Recipients_Name,
      required this.City,
      required this.Pincode});

  factory _$_Address.fromJson(Map<String, dynamic> json) =>
      _$$_AddressFromJson(json);

  @override
  final String addressId;
  @override
  final bool defaultAddress;
  @override
  final String Flat_FLoor_Tower;
  @override
  final String Street_Society;
  @override
  final String Recipients_Name;
  @override
  final String City;
  @override
  final String Pincode;

  @override
  String toString() {
    return 'Address(addressId: $addressId, defaultAddress: $defaultAddress, Flat_FLoor_Tower: $Flat_FLoor_Tower, Street_Society: $Street_Society, Recipients_Name: $Recipients_Name, City: $City, Pincode: $Pincode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Address &&
            (identical(other.addressId, addressId) ||
                other.addressId == addressId) &&
            (identical(other.defaultAddress, defaultAddress) ||
                other.defaultAddress == defaultAddress) &&
            (identical(other.Flat_FLoor_Tower, Flat_FLoor_Tower) ||
                other.Flat_FLoor_Tower == Flat_FLoor_Tower) &&
            (identical(other.Street_Society, Street_Society) ||
                other.Street_Society == Street_Society) &&
            (identical(other.Recipients_Name, Recipients_Name) ||
                other.Recipients_Name == Recipients_Name) &&
            (identical(other.City, City) || other.City == City) &&
            (identical(other.Pincode, Pincode) || other.Pincode == Pincode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, addressId, defaultAddress,
      Flat_FLoor_Tower, Street_Society, Recipients_Name, City, Pincode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddressCopyWith<_$_Address> get copyWith =>
      __$$_AddressCopyWithImpl<_$_Address>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressToJson(
      this,
    );
  }
}

abstract class _Address implements Address {
  factory _Address(
      {required final String addressId,
      required final bool defaultAddress,
      required final String Flat_FLoor_Tower,
      required final String Street_Society,
      required final String Recipients_Name,
      required final String City,
      required final String Pincode}) = _$_Address;

  factory _Address.fromJson(Map<String, dynamic> json) = _$_Address.fromJson;

  @override
  String get addressId;
  @override
  bool get defaultAddress;
  @override
  String get Flat_FLoor_Tower;
  @override
  String get Street_Society;
  @override
  String get Recipients_Name;
  @override
  String get City;
  @override
  String get Pincode;
  @override
  @JsonKey(ignore: true)
  _$$_AddressCopyWith<_$_Address> get copyWith =>
      throw _privateConstructorUsedError;
}
