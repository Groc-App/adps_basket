// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'addressbook.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddressBook _$AddressBookFromJson(Map<String, dynamic> json) {
  return _AddressBook.fromJson(json);
}

/// @nodoc
mixin _$AddressBook {
  List<Address> get addresses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressBookCopyWith<AddressBook> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressBookCopyWith<$Res> {
  factory $AddressBookCopyWith(
          AddressBook value, $Res Function(AddressBook) then) =
      _$AddressBookCopyWithImpl<$Res, AddressBook>;
  @useResult
  $Res call({List<Address> addresses});
}

/// @nodoc
class _$AddressBookCopyWithImpl<$Res, $Val extends AddressBook>
    implements $AddressBookCopyWith<$Res> {
  _$AddressBookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addresses = null,
  }) {
    return _then(_value.copyWith(
      addresses: null == addresses
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<Address>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddressBookCopyWith<$Res>
    implements $AddressBookCopyWith<$Res> {
  factory _$$_AddressBookCopyWith(
          _$_AddressBook value, $Res Function(_$_AddressBook) then) =
      __$$_AddressBookCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Address> addresses});
}

/// @nodoc
class __$$_AddressBookCopyWithImpl<$Res>
    extends _$AddressBookCopyWithImpl<$Res, _$_AddressBook>
    implements _$$_AddressBookCopyWith<$Res> {
  __$$_AddressBookCopyWithImpl(
      _$_AddressBook _value, $Res Function(_$_AddressBook) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addresses = null,
  }) {
    return _then(_$_AddressBook(
      addresses: null == addresses
          ? _value._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<Address>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddressBook implements _AddressBook {
  _$_AddressBook({required final List<Address> addresses})
      : _addresses = addresses;

  factory _$_AddressBook.fromJson(Map<String, dynamic> json) =>
      _$$_AddressBookFromJson(json);

  final List<Address> _addresses;
  @override
  List<Address> get addresses {
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addresses);
  }

  @override
  String toString() {
    return 'AddressBook(addresses: $addresses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddressBook &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_addresses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddressBookCopyWith<_$_AddressBook> get copyWith =>
      __$$_AddressBookCopyWithImpl<_$_AddressBook>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressBookToJson(
      this,
    );
  }
}

abstract class _AddressBook implements AddressBook {
  factory _AddressBook({required final List<Address> addresses}) =
      _$_AddressBook;

  factory _AddressBook.fromJson(Map<String, dynamic> json) =
      _$_AddressBook.fromJson;

  @override
  List<Address> get addresses;
  @override
  @JsonKey(ignore: true)
  _$$_AddressBookCopyWith<_$_AddressBook> get copyWith =>
      throw _privateConstructorUsedError;
}
