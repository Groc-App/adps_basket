// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'productdetail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductItem _$ProductItemFromJson(Map<String, dynamic> json) {
  return _ProductItem.fromJson(json);
}

/// @nodoc
mixin _$ProductItem {
  String get productId => throw _privateConstructorUsedError;
  String get Name => throw _privateConstructorUsedError;
  double get Price => throw _privateConstructorUsedError;
  String get ImageUrl => throw _privateConstructorUsedError;
  String get Quantity => throw _privateConstructorUsedError;
  String get Company => throw _privateConstructorUsedError;
  String get Description => throw _privateConstructorUsedError;
  Object get MainCategory => throw _privateConstructorUsedError;
  Object get Category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductItemCopyWith<ProductItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductItemCopyWith<$Res> {
  factory $ProductItemCopyWith(
          ProductItem value, $Res Function(ProductItem) then) =
      _$ProductItemCopyWithImpl<$Res, ProductItem>;
  @useResult
  $Res call(
      {String productId,
      String Name,
      double Price,
      String ImageUrl,
      String Quantity,
      String Company,
      String Description,
      Object MainCategory,
      Object Category});
}

/// @nodoc
class _$ProductItemCopyWithImpl<$Res, $Val extends ProductItem>
    implements $ProductItemCopyWith<$Res> {
  _$ProductItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? Name = null,
    Object? Price = null,
    Object? ImageUrl = null,
    Object? Quantity = null,
    Object? Company = null,
    Object? Description = null,
    Object? MainCategory = null,
    Object? Category = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      Name: null == Name
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as String,
      Price: null == Price
          ? _value.Price
          : Price // ignore: cast_nullable_to_non_nullable
              as double,
      ImageUrl: null == ImageUrl
          ? _value.ImageUrl
          : ImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      Quantity: null == Quantity
          ? _value.Quantity
          : Quantity // ignore: cast_nullable_to_non_nullable
              as String,
      Company: null == Company
          ? _value.Company
          : Company // ignore: cast_nullable_to_non_nullable
              as String,
      Description: null == Description
          ? _value.Description
          : Description // ignore: cast_nullable_to_non_nullable
              as String,
      MainCategory: null == MainCategory ? _value.MainCategory : MainCategory,
      Category: null == Category ? _value.Category : Category,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductItemCopyWith<$Res>
    implements $ProductItemCopyWith<$Res> {
  factory _$$_ProductItemCopyWith(
          _$_ProductItem value, $Res Function(_$_ProductItem) then) =
      __$$_ProductItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productId,
      String Name,
      double Price,
      String ImageUrl,
      String Quantity,
      String Company,
      String Description,
      Object MainCategory,
      Object Category});
}

/// @nodoc
class __$$_ProductItemCopyWithImpl<$Res>
    extends _$ProductItemCopyWithImpl<$Res, _$_ProductItem>
    implements _$$_ProductItemCopyWith<$Res> {
  __$$_ProductItemCopyWithImpl(
      _$_ProductItem _value, $Res Function(_$_ProductItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? Name = null,
    Object? Price = null,
    Object? ImageUrl = null,
    Object? Quantity = null,
    Object? Company = null,
    Object? Description = null,
    Object? MainCategory = null,
    Object? Category = null,
  }) {
    return _then(_$_ProductItem(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      Name: null == Name
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as String,
      Price: null == Price
          ? _value.Price
          : Price // ignore: cast_nullable_to_non_nullable
              as double,
      ImageUrl: null == ImageUrl
          ? _value.ImageUrl
          : ImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      Quantity: null == Quantity
          ? _value.Quantity
          : Quantity // ignore: cast_nullable_to_non_nullable
              as String,
      Company: null == Company
          ? _value.Company
          : Company // ignore: cast_nullable_to_non_nullable
              as String,
      Description: null == Description
          ? _value.Description
          : Description // ignore: cast_nullable_to_non_nullable
              as String,
      MainCategory: null == MainCategory ? _value.MainCategory : MainCategory,
      Category: null == Category ? _value.Category : Category,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductItem implements _ProductItem {
  _$_ProductItem(
      {required this.productId,
      required this.Name,
      required this.Price,
      required this.ImageUrl,
      required this.Quantity,
      required this.Company,
      required this.Description,
      required this.MainCategory,
      required this.Category});

  factory _$_ProductItem.fromJson(Map<String, dynamic> json) =>
      _$$_ProductItemFromJson(json);

  @override
  final String productId;
  @override
  final String Name;
  @override
  final double Price;
  @override
  final String ImageUrl;
  @override
  final String Quantity;
  @override
  final String Company;
  @override
  final String Description;
  @override
  final Object MainCategory;
  @override
  final Object Category;

  @override
  String toString() {
    return 'ProductItem(productId: $productId, Name: $Name, Price: $Price, ImageUrl: $ImageUrl, Quantity: $Quantity, Company: $Company, Description: $Description, MainCategory: $MainCategory, Category: $Category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductItem &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.Name, Name) || other.Name == Name) &&
            (identical(other.Price, Price) || other.Price == Price) &&
            (identical(other.ImageUrl, ImageUrl) ||
                other.ImageUrl == ImageUrl) &&
            (identical(other.Quantity, Quantity) ||
                other.Quantity == Quantity) &&
            (identical(other.Company, Company) || other.Company == Company) &&
            (identical(other.Description, Description) ||
                other.Description == Description) &&
            const DeepCollectionEquality()
                .equals(other.MainCategory, MainCategory) &&
            const DeepCollectionEquality().equals(other.Category, Category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      productId,
      Name,
      Price,
      ImageUrl,
      Quantity,
      Company,
      Description,
      const DeepCollectionEquality().hash(MainCategory),
      const DeepCollectionEquality().hash(Category));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductItemCopyWith<_$_ProductItem> get copyWith =>
      __$$_ProductItemCopyWithImpl<_$_ProductItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductItemToJson(
      this,
    );
  }
}

abstract class _ProductItem implements ProductItem {
  factory _ProductItem(
      {required final String productId,
      required final String Name,
      required final double Price,
      required final String ImageUrl,
      required final String Quantity,
      required final String Company,
      required final String Description,
      required final Object MainCategory,
      required final Object Category}) = _$_ProductItem;

  factory _ProductItem.fromJson(Map<String, dynamic> json) =
      _$_ProductItem.fromJson;

  @override
  String get productId;
  @override
  String get Name;
  @override
  double get Price;
  @override
  String get ImageUrl;
  @override
  String get Quantity;
  @override
  String get Company;
  @override
  String get Description;
  @override
  Object get MainCategory;
  @override
  Object get Category;
  @override
  @JsonKey(ignore: true)
  _$$_ProductItemCopyWith<_$_ProductItem> get copyWith =>
      throw _privateConstructorUsedError;
}
