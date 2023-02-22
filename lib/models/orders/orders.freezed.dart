// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Orders _$OrdersFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Orders {
  String get OrderId => throw _privateConstructorUsedError;
  String get Address => throw _privateConstructorUsedError;
  int get TotalAmount => throw _privateConstructorUsedError;
  DateTime get Date => throw _privateConstructorUsedError;
  String get OrderStatus => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get OrderDetails =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrdersCopyWith<Orders> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersCopyWith<$Res> {
  factory $OrdersCopyWith(Orders value, $Res Function(Orders) then) =
      _$OrdersCopyWithImpl<$Res, Orders>;
  @useResult
  $Res call(
      {String OrderId,
      String Address,
      int TotalAmount,
      DateTime Date,
      String OrderStatus,
      List<Map<String, dynamic>> OrderDetails});
}

/// @nodoc
class _$OrdersCopyWithImpl<$Res, $Val extends Orders>
    implements $OrdersCopyWith<$Res> {
  _$OrdersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? OrderId = null,
    Object? Address = null,
    Object? TotalAmount = null,
    Object? Date = null,
    Object? OrderStatus = null,
    Object? OrderDetails = null,
  }) {
    return _then(_value.copyWith(
      OrderId: null == OrderId
          ? _value.OrderId
          : OrderId // ignore: cast_nullable_to_non_nullable
              as String,
      Address: null == Address
          ? _value.Address
          : Address // ignore: cast_nullable_to_non_nullable
              as String,
      TotalAmount: null == TotalAmount
          ? _value.TotalAmount
          : TotalAmount // ignore: cast_nullable_to_non_nullable
              as int,
      Date: null == Date
          ? _value.Date
          : Date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      OrderStatus: null == OrderStatus
          ? _value.OrderStatus
          : OrderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      OrderDetails: null == OrderDetails
          ? _value.OrderDetails
          : OrderDetails // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderCopyWith<$Res> implements $OrdersCopyWith<$Res> {
  factory _$$_OrderCopyWith(_$_Order value, $Res Function(_$_Order) then) =
      __$$_OrderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String OrderId,
      String Address,
      int TotalAmount,
      DateTime Date,
      String OrderStatus,
      List<Map<String, dynamic>> OrderDetails});
}

/// @nodoc
class __$$_OrderCopyWithImpl<$Res> extends _$OrdersCopyWithImpl<$Res, _$_Order>
    implements _$$_OrderCopyWith<$Res> {
  __$$_OrderCopyWithImpl(_$_Order _value, $Res Function(_$_Order) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? OrderId = null,
    Object? Address = null,
    Object? TotalAmount = null,
    Object? Date = null,
    Object? OrderStatus = null,
    Object? OrderDetails = null,
  }) {
    return _then(_$_Order(
      OrderId: null == OrderId
          ? _value.OrderId
          : OrderId // ignore: cast_nullable_to_non_nullable
              as String,
      Address: null == Address
          ? _value.Address
          : Address // ignore: cast_nullable_to_non_nullable
              as String,
      TotalAmount: null == TotalAmount
          ? _value.TotalAmount
          : TotalAmount // ignore: cast_nullable_to_non_nullable
              as int,
      Date: null == Date
          ? _value.Date
          : Date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      OrderStatus: null == OrderStatus
          ? _value.OrderStatus
          : OrderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      OrderDetails: null == OrderDetails
          ? _value._OrderDetails
          : OrderDetails // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Order implements _Order {
  _$_Order(
      {required this.OrderId,
      required this.Address,
      required this.TotalAmount,
      required this.Date,
      required this.OrderStatus,
      required final List<Map<String, dynamic>> OrderDetails})
      : _OrderDetails = OrderDetails;

  factory _$_Order.fromJson(Map<String, dynamic> json) =>
      _$$_OrderFromJson(json);

  @override
  final String OrderId;
  @override
  final String Address;
  @override
  final int TotalAmount;
  @override
  final DateTime Date;
  @override
  final String OrderStatus;
  final List<Map<String, dynamic>> _OrderDetails;
  @override
  List<Map<String, dynamic>> get OrderDetails {
    if (_OrderDetails is EqualUnmodifiableListView) return _OrderDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_OrderDetails);
  }

  @override
  String toString() {
    return 'Orders(OrderId: $OrderId, Address: $Address, TotalAmount: $TotalAmount, Date: $Date, OrderStatus: $OrderStatus, OrderDetails: $OrderDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Order &&
            (identical(other.OrderId, OrderId) || other.OrderId == OrderId) &&
            (identical(other.Address, Address) || other.Address == Address) &&
            (identical(other.TotalAmount, TotalAmount) ||
                other.TotalAmount == TotalAmount) &&
            (identical(other.Date, Date) || other.Date == Date) &&
            (identical(other.OrderStatus, OrderStatus) ||
                other.OrderStatus == OrderStatus) &&
            const DeepCollectionEquality()
                .equals(other._OrderDetails, _OrderDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, OrderId, Address, TotalAmount,
      Date, OrderStatus, const DeepCollectionEquality().hash(_OrderDetails));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      __$$_OrderCopyWithImpl<_$_Order>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderToJson(
      this,
    );
  }
}

abstract class _Order implements Orders {
  factory _Order(
      {required final String OrderId,
      required final String Address,
      required final int TotalAmount,
      required final DateTime Date,
      required final String OrderStatus,
      required final List<Map<String, dynamic>> OrderDetails}) = _$_Order;

  factory _Order.fromJson(Map<String, dynamic> json) = _$_Order.fromJson;

  @override
  String get OrderId;
  @override
  String get Address;
  @override
  int get TotalAmount;
  @override
  DateTime get Date;
  @override
  String get OrderStatus;
  @override
  List<Map<String, dynamic>> get OrderDetails;
  @override
  @JsonKey(ignore: true)
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      throw _privateConstructorUsedError;
}
