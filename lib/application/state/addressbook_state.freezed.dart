// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'addressbook_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddressBookState {
  AddressBook? get AddressBookModel => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddressBookStateCopyWith<AddressBookState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressBookStateCopyWith<$Res> {
  factory $AddressBookStateCopyWith(
          AddressBookState value, $Res Function(AddressBookState) then) =
      _$AddressBookStateCopyWithImpl<$Res, AddressBookState>;
  @useResult
  $Res call({AddressBook? AddressBookModel, bool isLoading});

  $AddressBookCopyWith<$Res>? get AddressBookModel;
}

/// @nodoc
class _$AddressBookStateCopyWithImpl<$Res, $Val extends AddressBookState>
    implements $AddressBookStateCopyWith<$Res> {
  _$AddressBookStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? AddressBookModel = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      AddressBookModel: freezed == AddressBookModel
          ? _value.AddressBookModel
          : AddressBookModel // ignore: cast_nullable_to_non_nullable
              as AddressBook?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressBookCopyWith<$Res>? get AddressBookModel {
    if (_value.AddressBookModel == null) {
      return null;
    }

    return $AddressBookCopyWith<$Res>(_value.AddressBookModel!, (value) {
      return _then(_value.copyWith(AddressBookModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AddressBookStateCopyWith<$Res>
    implements $AddressBookStateCopyWith<$Res> {
  factory _$$_AddressBookStateCopyWith(
          _$_AddressBookState value, $Res Function(_$_AddressBookState) then) =
      __$$_AddressBookStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AddressBook? AddressBookModel, bool isLoading});

  @override
  $AddressBookCopyWith<$Res>? get AddressBookModel;
}

/// @nodoc
class __$$_AddressBookStateCopyWithImpl<$Res>
    extends _$AddressBookStateCopyWithImpl<$Res, _$_AddressBookState>
    implements _$$_AddressBookStateCopyWith<$Res> {
  __$$_AddressBookStateCopyWithImpl(
      _$_AddressBookState _value, $Res Function(_$_AddressBookState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? AddressBookModel = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$_AddressBookState(
      AddressBookModel: freezed == AddressBookModel
          ? _value.AddressBookModel
          : AddressBookModel // ignore: cast_nullable_to_non_nullable
              as AddressBook?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AddressBookState implements _AddressBookState {
  const _$_AddressBookState({this.AddressBookModel, this.isLoading = false});

  @override
  final AddressBook? AddressBookModel;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'AddressBookState(AddressBookModel: $AddressBookModel, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddressBookState &&
            (identical(other.AddressBookModel, AddressBookModel) ||
                other.AddressBookModel == AddressBookModel) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, AddressBookModel, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddressBookStateCopyWith<_$_AddressBookState> get copyWith =>
      __$$_AddressBookStateCopyWithImpl<_$_AddressBookState>(this, _$identity);
}

abstract class _AddressBookState implements AddressBookState {
  const factory _AddressBookState(
      {final AddressBook? AddressBookModel,
      final bool isLoading}) = _$_AddressBookState;

  @override
  AddressBook? get AddressBookModel;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_AddressBookStateCopyWith<_$_AddressBookState> get copyWith =>
      throw _privateConstructorUsedError;
}
