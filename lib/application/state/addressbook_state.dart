import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/address/addressbook.dart';

part 'addressbook_state.freezed.dart';

@freezed
class AddressBookState with _$AddressBookState {
  const factory AddressBookState({
    AddressBook? AddressBookModel,
    @Default(false) bool isLoading,
  }) = _AddressBookState;
}
