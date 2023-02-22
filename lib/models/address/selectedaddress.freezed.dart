// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selectedaddress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SelectedAddress _$SelectedAddressFromJson(Map<String, dynamic> json) {
  return _SelectedAddress.fromJson(json);
}

/// @nodoc
mixin _$SelectedAddress {
  String get Flat_FLoor_Tower => throw _privateConstructorUsedError;
  String get Street_Society => throw _privateConstructorUsedError;
  String get Recipients_Name => throw _privateConstructorUsedError;
  String get City => throw _privateConstructorUsedError;
  String get Pincode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SelectedAddressCopyWith<SelectedAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedAddressCopyWith<$Res> {
  factory $SelectedAddressCopyWith(
          SelectedAddress value, $Res Function(SelectedAddress) then) =
      _$SelectedAddressCopyWithImpl<$Res, SelectedAddress>;
  @useResult
  $Res call(
      {String Flat_FLoor_Tower,
      String Street_Society,
      String Recipients_Name,
      String City,
      String Pincode});
}

/// @nodoc
class _$SelectedAddressCopyWithImpl<$Res, $Val extends SelectedAddress>
    implements $SelectedAddressCopyWith<$Res> {
  _$SelectedAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Flat_FLoor_Tower = null,
    Object? Street_Society = null,
    Object? Recipients_Name = null,
    Object? City = null,
    Object? Pincode = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$_SelectedAddressCopyWith<$Res>
    implements $SelectedAddressCopyWith<$Res> {
  factory _$$_SelectedAddressCopyWith(
          _$_SelectedAddress value, $Res Function(_$_SelectedAddress) then) =
      __$$_SelectedAddressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String Flat_FLoor_Tower,
      String Street_Society,
      String Recipients_Name,
      String City,
      String Pincode});
}

/// @nodoc
class __$$_SelectedAddressCopyWithImpl<$Res>
    extends _$SelectedAddressCopyWithImpl<$Res, _$_SelectedAddress>
    implements _$$_SelectedAddressCopyWith<$Res> {
  __$$_SelectedAddressCopyWithImpl(
      _$_SelectedAddress _value, $Res Function(_$_SelectedAddress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Flat_FLoor_Tower = null,
    Object? Street_Society = null,
    Object? Recipients_Name = null,
    Object? City = null,
    Object? Pincode = null,
  }) {
    return _then(_$_SelectedAddress(
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
class _$_SelectedAddress implements _SelectedAddress {
  _$_SelectedAddress(
      {this.Flat_FLoor_Tower = '',
      this.Street_Society = '',
      this.Recipients_Name = '',
      this.City = '',
      this.Pincode = ''});

  factory _$_SelectedAddress.fromJson(Map<String, dynamic> json) =>
      _$$_SelectedAddressFromJson(json);

  @override
  @JsonKey()
  final String Flat_FLoor_Tower;
  @override
  @JsonKey()
  final String Street_Society;
  @override
  @JsonKey()
  final String Recipients_Name;
  @override
  @JsonKey()
  final String City;
  @override
  @JsonKey()
  final String Pincode;

  @override
  String toString() {
    return 'SelectedAddress(Flat_FLoor_Tower: $Flat_FLoor_Tower, Street_Society: $Street_Society, Recipients_Name: $Recipients_Name, City: $City, Pincode: $Pincode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectedAddress &&
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
  int get hashCode => Object.hash(runtimeType, Flat_FLoor_Tower, Street_Society,
      Recipients_Name, City, Pincode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectedAddressCopyWith<_$_SelectedAddress> get copyWith =>
      __$$_SelectedAddressCopyWithImpl<_$_SelectedAddress>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SelectedAddressToJson(
      this,
    );
  }
}

abstract class _SelectedAddress implements SelectedAddress {
  factory _SelectedAddress(
      {final String Flat_FLoor_Tower,
      final String Street_Society,
      final String Recipients_Name,
      final String City,
      final String Pincode}) = _$_SelectedAddress;

  factory _SelectedAddress.fromJson(Map<String, dynamic> json) =
      _$_SelectedAddress.fromJson;

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
  _$$_SelectedAddressCopyWith<_$_SelectedAddress> get copyWith =>
      throw _privateConstructorUsedError;
}
