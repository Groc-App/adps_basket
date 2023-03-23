// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Offer _$OfferFromJson(Map<String, dynamic> json) {
  return _Offer.fromJson(json);
}

/// @nodoc
mixin _$Offer {
  String get offerId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get isUserClaimed => throw _privateConstructorUsedError;
  bool get isUserRedeemed => throw _privateConstructorUsedError;
  double get worth => throw _privateConstructorUsedError;
  double get number => throw _privateConstructorUsedError;
  double get totalUserOrder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfferCopyWith<Offer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferCopyWith<$Res> {
  factory $OfferCopyWith(Offer value, $Res Function(Offer) then) =
      _$OfferCopyWithImpl<$Res, Offer>;
  @useResult
  $Res call(
      {String offerId,
      String name,
      String description,
      bool isUserClaimed,
      bool isUserRedeemed,
      double worth,
      double number,
      double totalUserOrder});
}

/// @nodoc
class _$OfferCopyWithImpl<$Res, $Val extends Offer>
    implements $OfferCopyWith<$Res> {
  _$OfferCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offerId = null,
    Object? name = null,
    Object? description = null,
    Object? isUserClaimed = null,
    Object? isUserRedeemed = null,
    Object? worth = null,
    Object? number = null,
    Object? totalUserOrder = null,
  }) {
    return _then(_value.copyWith(
      offerId: null == offerId
          ? _value.offerId
          : offerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isUserClaimed: null == isUserClaimed
          ? _value.isUserClaimed
          : isUserClaimed // ignore: cast_nullable_to_non_nullable
              as bool,
      isUserRedeemed: null == isUserRedeemed
          ? _value.isUserRedeemed
          : isUserRedeemed // ignore: cast_nullable_to_non_nullable
              as bool,
      worth: null == worth
          ? _value.worth
          : worth // ignore: cast_nullable_to_non_nullable
              as double,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as double,
      totalUserOrder: null == totalUserOrder
          ? _value.totalUserOrder
          : totalUserOrder // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OfferCopyWith<$Res> implements $OfferCopyWith<$Res> {
  factory _$$_OfferCopyWith(_$_Offer value, $Res Function(_$_Offer) then) =
      __$$_OfferCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String offerId,
      String name,
      String description,
      bool isUserClaimed,
      bool isUserRedeemed,
      double worth,
      double number,
      double totalUserOrder});
}

/// @nodoc
class __$$_OfferCopyWithImpl<$Res> extends _$OfferCopyWithImpl<$Res, _$_Offer>
    implements _$$_OfferCopyWith<$Res> {
  __$$_OfferCopyWithImpl(_$_Offer _value, $Res Function(_$_Offer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offerId = null,
    Object? name = null,
    Object? description = null,
    Object? isUserClaimed = null,
    Object? isUserRedeemed = null,
    Object? worth = null,
    Object? number = null,
    Object? totalUserOrder = null,
  }) {
    return _then(_$_Offer(
      offerId: null == offerId
          ? _value.offerId
          : offerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isUserClaimed: null == isUserClaimed
          ? _value.isUserClaimed
          : isUserClaimed // ignore: cast_nullable_to_non_nullable
              as bool,
      isUserRedeemed: null == isUserRedeemed
          ? _value.isUserRedeemed
          : isUserRedeemed // ignore: cast_nullable_to_non_nullable
              as bool,
      worth: null == worth
          ? _value.worth
          : worth // ignore: cast_nullable_to_non_nullable
              as double,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as double,
      totalUserOrder: null == totalUserOrder
          ? _value.totalUserOrder
          : totalUserOrder // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Offer implements _Offer {
  _$_Offer(
      {required this.offerId,
      required this.name,
      required this.description,
      required this.isUserClaimed,
      required this.isUserRedeemed,
      required this.worth,
      required this.number,
      required this.totalUserOrder});

  factory _$_Offer.fromJson(Map<String, dynamic> json) =>
      _$$_OfferFromJson(json);

  @override
  final String offerId;
  @override
  final String name;
  @override
  final String description;
  @override
  final bool isUserClaimed;
  @override
  final bool isUserRedeemed;
  @override
  final double worth;
  @override
  final double number;
  @override
  final double totalUserOrder;

  @override
  String toString() {
    return 'Offer(offerId: $offerId, name: $name, description: $description, isUserClaimed: $isUserClaimed, isUserRedeemed: $isUserRedeemed, worth: $worth, number: $number, totalUserOrder: $totalUserOrder)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Offer &&
            (identical(other.offerId, offerId) || other.offerId == offerId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isUserClaimed, isUserClaimed) ||
                other.isUserClaimed == isUserClaimed) &&
            (identical(other.isUserRedeemed, isUserRedeemed) ||
                other.isUserRedeemed == isUserRedeemed) &&
            (identical(other.worth, worth) || other.worth == worth) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.totalUserOrder, totalUserOrder) ||
                other.totalUserOrder == totalUserOrder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, offerId, name, description,
      isUserClaimed, isUserRedeemed, worth, number, totalUserOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OfferCopyWith<_$_Offer> get copyWith =>
      __$$_OfferCopyWithImpl<_$_Offer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OfferToJson(
      this,
    );
  }
}

abstract class _Offer implements Offer {
  factory _Offer(
      {required final String offerId,
      required final String name,
      required final String description,
      required final bool isUserClaimed,
      required final bool isUserRedeemed,
      required final double worth,
      required final double number,
      required final double totalUserOrder}) = _$_Offer;

  factory _Offer.fromJson(Map<String, dynamic> json) = _$_Offer.fromJson;

  @override
  String get offerId;
  @override
  String get name;
  @override
  String get description;
  @override
  bool get isUserClaimed;
  @override
  bool get isUserRedeemed;
  @override
  double get worth;
  @override
  double get number;
  @override
  double get totalUserOrder;
  @override
  @JsonKey(ignore: true)
  _$$_OfferCopyWith<_$_Offer> get copyWith =>
      throw _privateConstructorUsedError;
}
