import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/models/cart/cart.dart';
import 'package:your_basket/models/cart/cartitem.dart';

import '../../Services/address_api_service.dart';
import '../state/addressbook_state.dart';

class AddressBookNotifier extends StateNotifier<AddressBookState> {
  final APIServiceAddress _apiService;

  AddressBookNotifier(this._apiService) : super(const AddressBookState()) {
    getAddresses();
  }

  Future<void> getAddresses() async {
    state = state.copyWith(isLoading: true);

    var addbookdata = await _apiService.fetchalladdressbyid();
    print("This is cartdata from Cart Notifier $addbookdata");
    state = state.copyWith(AddressBookModel: addbookdata);
    state = state.copyWith(isLoading: false);
  }

  Future<void> addNewAddress(mp) async {
    await _apiService.addnewaddress(mp);

    await getAddresses();
  }
}
