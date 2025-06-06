// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cartitem.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return _CartItem.fromJson(json);
}

/// @nodoc
mixin _$CartItem {
  ProductItem get Item => throw _privateConstructorUsedError;
  int get ItemCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartItemCopyWith<CartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemCopyWith<$Res> {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) then) =
      _$CartItemCopyWithImpl<$Res, CartItem>;
  @useResult
  $Res call({ProductItem Item, int ItemCount});

  $ProductItemCopyWith<$Res> get Item;
}

/// @nodoc
class _$CartItemCopyWithImpl<$Res, $Val extends CartItem>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Item = null,
    Object? ItemCount = null,
  }) {
    return _then(_value.copyWith(
      Item: null == Item
          ? _value.Item
          : Item // ignore: cast_nullable_to_non_nullable
              as ProductItem,
      ItemCount: null == ItemCount
          ? _value.ItemCount
          : ItemCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductItemCopyWith<$Res> get Item {
    return $ProductItemCopyWith<$Res>(_value.Item, (value) {
      return _then(_value.copyWith(Item: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CartItemCopyWith<$Res> implements $CartItemCopyWith<$Res> {
  factory _$$_CartItemCopyWith(
          _$_CartItem value, $Res Function(_$_CartItem) then) =
      __$$_CartItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProductItem Item, int ItemCount});

  @override
  $ProductItemCopyWith<$Res> get Item;
}

/// @nodoc
class __$$_CartItemCopyWithImpl<$Res>
    extends _$CartItemCopyWithImpl<$Res, _$_CartItem>
    implements _$$_CartItemCopyWith<$Res> {
  __$$_CartItemCopyWithImpl(
      _$_CartItem _value, $Res Function(_$_CartItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Item = null,
    Object? ItemCount = null,
  }) {
    return _then(_$_CartItem(
      Item: null == Item
          ? _value.Item
          : Item // ignore: cast_nullable_to_non_nullable
              as ProductItem,
      ItemCount: null == ItemCount
          ? _value.ItemCount
          : ItemCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CartItem implements _CartItem {
  _$_CartItem({required this.Item, required this.ItemCount});

  factory _$_CartItem.fromJson(Map<String, dynamic> json) =>
      _$$_CartItemFromJson(json);

  @override
  final ProductItem Item;
  @override
  final int ItemCount;

  @override
  String toString() {
    return 'CartItem(Item: $Item, ItemCount: $ItemCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartItem &&
            (identical(other.Item, Item) || other.Item == Item) &&
            (identical(other.ItemCount, ItemCount) ||
                other.ItemCount == ItemCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, Item, ItemCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartItemCopyWith<_$_CartItem> get copyWith =>
      __$$_CartItemCopyWithImpl<_$_CartItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartItemToJson(
      this,
    );
  }
}

abstract class _CartItem implements CartItem {
  factory _CartItem(
      {required final ProductItem Item,
      required final int ItemCount}) = _$_CartItem;

  factory _CartItem.fromJson(Map<String, dynamic> json) = _$_CartItem.fromJson;

  @override
  ProductItem get Item;
  @override
  int get ItemCount;
  @override
  @JsonKey(ignore: true)
  _$$_CartItemCopyWith<_$_CartItem> get copyWith =>
      throw _privateConstructorUsedError;
}
