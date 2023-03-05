// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  String get productId => throw _privateConstructorUsedError;
  String get Name => throw _privateConstructorUsedError;
  double get Price => throw _privateConstructorUsedError;
  List<String> get ImageUrl => throw _privateConstructorUsedError;
  String get Quantity => throw _privateConstructorUsedError;
  String get Company => throw _privateConstructorUsedError;
  String get Description => throw _privateConstructorUsedError;
  Object get MainCategory => throw _privateConstructorUsedError;
  Object get Category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {String productId,
      String Name,
      double Price,
      List<String> ImageUrl,
      String Quantity,
      String Company,
      String Description,
      Object MainCategory,
      Object Category});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

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
              as List<String>,
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
abstract class _$$_ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$_ProductCopyWith(
          _$_Product value, $Res Function(_$_Product) then) =
      __$$_ProductCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productId,
      String Name,
      double Price,
      List<String> ImageUrl,
      String Quantity,
      String Company,
      String Description,
      Object MainCategory,
      Object Category});
}

/// @nodoc
class __$$_ProductCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$_Product>
    implements _$$_ProductCopyWith<$Res> {
  __$$_ProductCopyWithImpl(_$_Product _value, $Res Function(_$_Product) _then)
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
    return _then(_$_Product(
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
          ? _value._ImageUrl
          : ImageUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
class _$_Product implements _Product {
  _$_Product(
      {required this.productId,
      required this.Name,
      required this.Price,
      required final List<String> ImageUrl,
      required this.Quantity,
      required this.Company,
      required this.Description,
      required this.MainCategory,
      required this.Category})
      : _ImageUrl = ImageUrl;

  factory _$_Product.fromJson(Map<String, dynamic> json) =>
      _$$_ProductFromJson(json);

  @override
  final String productId;
  @override
  final String Name;
  @override
  final double Price;
  final List<String> _ImageUrl;
  @override
  List<String> get ImageUrl {
    if (_ImageUrl is EqualUnmodifiableListView) return _ImageUrl;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ImageUrl);
  }

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
    return 'Product(productId: $productId, Name: $Name, Price: $Price, ImageUrl: $ImageUrl, Quantity: $Quantity, Company: $Company, Description: $Description, MainCategory: $MainCategory, Category: $Category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Product &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.Name, Name) || other.Name == Name) &&
            (identical(other.Price, Price) || other.Price == Price) &&
            const DeepCollectionEquality().equals(other._ImageUrl, _ImageUrl) &&
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
      const DeepCollectionEquality().hash(_ImageUrl),
      Quantity,
      Company,
      Description,
      const DeepCollectionEquality().hash(MainCategory),
      const DeepCollectionEquality().hash(Category));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductCopyWith<_$_Product> get copyWith =>
      __$$_ProductCopyWithImpl<_$_Product>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  factory _Product(
      {required final String productId,
      required final String Name,
      required final double Price,
      required final List<String> ImageUrl,
      required final String Quantity,
      required final String Company,
      required final String Description,
      required final Object MainCategory,
      required final Object Category}) = _$_Product;

  factory _Product.fromJson(Map<String, dynamic> json) = _$_Product.fromJson;

  @override
  String get productId;
  @override
  String get Name;
  @override
  double get Price;
  @override
  List<String> get ImageUrl;
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
  _$$_ProductCopyWith<_$_Product> get copyWith =>
      throw _privateConstructorUsedError;
}
