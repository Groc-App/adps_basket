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

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  String get Name => throw _privateConstructorUsedError;
  String get Price => throw _privateConstructorUsedError;
  String get Description => throw _privateConstructorUsedError;
  String get Quantity => throw _privateConstructorUsedError;
  String get Company => throw _privateConstructorUsedError;
  String get ImageUrl => throw _privateConstructorUsedError;

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
      {String Name,
      String Price,
      String Description,
      String Quantity,
      String Company,
      String ImageUrl});
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
    Object? Name = null,
    Object? Price = null,
    Object? Description = null,
    Object? Quantity = null,
    Object? Company = null,
    Object? ImageUrl = null,
  }) {
    return _then(_value.copyWith(
      Name: null == Name
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as String,
      Price: null == Price
          ? _value.Price
          : Price // ignore: cast_nullable_to_non_nullable
              as String,
      Description: null == Description
          ? _value.Description
          : Description // ignore: cast_nullable_to_non_nullable
              as String,
      Quantity: null == Quantity
          ? _value.Quantity
          : Quantity // ignore: cast_nullable_to_non_nullable
              as String,
      Company: null == Company
          ? _value.Company
          : Company // ignore: cast_nullable_to_non_nullable
              as String,
      ImageUrl: null == ImageUrl
          ? _value.ImageUrl
          : ImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
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
      {String Name,
      String Price,
      String Description,
      String Quantity,
      String Company,
      String ImageUrl});
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
    Object? Name = null,
    Object? Price = null,
    Object? Description = null,
    Object? Quantity = null,
    Object? Company = null,
    Object? ImageUrl = null,
  }) {
    return _then(_$_Product(
      Name: null == Name
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as String,
      Price: null == Price
          ? _value.Price
          : Price // ignore: cast_nullable_to_non_nullable
              as String,
      Description: null == Description
          ? _value.Description
          : Description // ignore: cast_nullable_to_non_nullable
              as String,
      Quantity: null == Quantity
          ? _value.Quantity
          : Quantity // ignore: cast_nullable_to_non_nullable
              as String,
      Company: null == Company
          ? _value.Company
          : Company // ignore: cast_nullable_to_non_nullable
              as String,
      ImageUrl: null == ImageUrl
          ? _value.ImageUrl
          : ImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Product implements _Product {
  _$_Product(
      {required this.Name,
      required this.Price,
      required this.Description,
      required this.Quantity,
      required this.Company,
      required this.ImageUrl});

  factory _$_Product.fromJson(Map<String, dynamic> json) =>
      _$$_ProductFromJson(json);

  @override
  final String Name;
  @override
  final String Price;
  @override
  final String Description;
  @override
  final String Quantity;
  @override
  final String Company;
  @override
  final String ImageUrl;

  @override
  String toString() {
    return 'Product(Name: $Name, Price: $Price, Description: $Description, Quantity: $Quantity, Company: $Company, ImageUrl: $ImageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Product &&
            (identical(other.Name, Name) || other.Name == Name) &&
            (identical(other.Price, Price) || other.Price == Price) &&
            (identical(other.Description, Description) ||
                other.Description == Description) &&
            (identical(other.Quantity, Quantity) ||
                other.Quantity == Quantity) &&
            (identical(other.Company, Company) || other.Company == Company) &&
            (identical(other.ImageUrl, ImageUrl) ||
                other.ImageUrl == ImageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, Name, Price, Description, Quantity, Company, ImageUrl);

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
      {required final String Name,
      required final String Price,
      required final String Description,
      required final String Quantity,
      required final String Company,
      required final String ImageUrl}) = _$_Product;

  factory _Product.fromJson(Map<String, dynamic> json) = _$_Product.fromJson;

  @override
  String get Name;
  @override
  String get Price;
  @override
  String get Description;
  @override
  String get Quantity;
  @override
  String get Company;
  @override
  String get ImageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_ProductCopyWith<_$_Product> get copyWith =>
      throw _privateConstructorUsedError;
}
