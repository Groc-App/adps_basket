// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserN _$UserNFromJson(Map<String, dynamic> json) {
  return _UserN.fromJson(json);
}

/// @nodoc
mixin _$UserN {
  String get Number => throw _privateConstructorUsedError;
  Map<String, int> get referralOffer => throw _privateConstructorUsedError;
  String get referralCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserNCopyWith<UserN> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserNCopyWith<$Res> {
  factory $UserNCopyWith(UserN value, $Res Function(UserN) then) =
      _$UserNCopyWithImpl<$Res, UserN>;
  @useResult
  $Res call(
      {String Number, Map<String, int> referralOffer, String referralCode});
}

/// @nodoc
class _$UserNCopyWithImpl<$Res, $Val extends UserN>
    implements $UserNCopyWith<$Res> {
  _$UserNCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Number = null,
    Object? referralOffer = null,
    Object? referralCode = null,
  }) {
    return _then(_value.copyWith(
      Number: null == Number
          ? _value.Number
          : Number // ignore: cast_nullable_to_non_nullable
              as String,
      referralOffer: null == referralOffer
          ? _value.referralOffer
          : referralOffer // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      referralCode: null == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserNCopyWith<$Res> implements $UserNCopyWith<$Res> {
  factory _$$_UserNCopyWith(_$_UserN value, $Res Function(_$_UserN) then) =
      __$$_UserNCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String Number, Map<String, int> referralOffer, String referralCode});
}

/// @nodoc
class __$$_UserNCopyWithImpl<$Res> extends _$UserNCopyWithImpl<$Res, _$_UserN>
    implements _$$_UserNCopyWith<$Res> {
  __$$_UserNCopyWithImpl(_$_UserN _value, $Res Function(_$_UserN) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Number = null,
    Object? referralOffer = null,
    Object? referralCode = null,
  }) {
    return _then(_$_UserN(
      Number: null == Number
          ? _value.Number
          : Number // ignore: cast_nullable_to_non_nullable
              as String,
      referralOffer: null == referralOffer
          ? _value._referralOffer
          : referralOffer // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      referralCode: null == referralCode
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserN implements _UserN {
  _$_UserN(
      {required this.Number,
      required final Map<String, int> referralOffer,
      required this.referralCode})
      : _referralOffer = referralOffer;

  factory _$_UserN.fromJson(Map<String, dynamic> json) =>
      _$$_UserNFromJson(json);

  @override
  final String Number;
  final Map<String, int> _referralOffer;
  @override
  Map<String, int> get referralOffer {
    if (_referralOffer is EqualUnmodifiableMapView) return _referralOffer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_referralOffer);
  }

  @override
  final String referralCode;

  @override
  String toString() {
    return 'UserN(Number: $Number, referralOffer: $referralOffer, referralCode: $referralCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserN &&
            (identical(other.Number, Number) || other.Number == Number) &&
            const DeepCollectionEquality()
                .equals(other._referralOffer, _referralOffer) &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, Number,
      const DeepCollectionEquality().hash(_referralOffer), referralCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserNCopyWith<_$_UserN> get copyWith =>
      __$$_UserNCopyWithImpl<_$_UserN>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserNToJson(
      this,
    );
  }
}

abstract class _UserN implements UserN {
  factory _UserN(
      {required final String Number,
      required final Map<String, int> referralOffer,
      required final String referralCode}) = _$_UserN;

  factory _UserN.fromJson(Map<String, dynamic> json) = _$_UserN.fromJson;

  @override
  String get Number;
  @override
  Map<String, int> get referralOffer;
  @override
  String get referralCode;
  @override
  @JsonKey(ignore: true)
  _$$_UserNCopyWith<_$_UserN> get copyWith =>
      throw _privateConstructorUsedError;
}
