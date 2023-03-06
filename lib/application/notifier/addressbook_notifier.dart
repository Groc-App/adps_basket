import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Services/address_api_service.dart';
import '../../models/address/selectedaddress.dart';
import '../state/addressbook_state.dart';

class AddressBookNotifier extends StateNotifier<AddressBookState> {
  final APIServiceAddress _apiService;
  String? number;

  AddressBookNotifier(this._apiService, this.number)
      : super(const AddressBookState()) {
    getAddresses(number);
  }

  Future<void> getAddresses(String? number) async {
    state = state.copyWith(isLoading: true);

    // Future.delayed(const Duration(seconds: 10), () async {
    var addbookdata = await _apiService.fetchalladdressbyid(number);
    state = state.copyWith(AddressBookModel: addbookdata);
    state = state.copyWith(isLoading: false);
    // });
    // print("This is addressdata from Address Notifier $addbookdata");
  }

  Future<void> addNewAddress(mp) async {
    await _apiService.addnewaddress(mp);

    await getAddresses(mp["number"]);
  }

  Future<void> deleteAddress(userid, addressid) async {
    await _apiService.deleteaddress(userid, addressid);

    // var isAddressExist = state.AddressBookModel!.addresses
    //     .firstWhere((e) => e.addressId == addressid);
    // var updatedItems = state.AddressBookModel!.addresses.toList();
    // updatedItems.remove(isAddressExist);
    // AddressBook newbook = AddressBook(addresses: updatedItems);
    // state = state.copyWith(AddressBookModel: newbook);

    await getAddresses(userid);
  }

  Future<void> updateAddress(
      Map<String, String?> addressdetail, String addressId) async {
    await _apiService.updateaddress(addressdetail, addressId);

    // var isAddressExist = state.AddressBookModel!.addresses
    //     .firstWhere((e) => e.addressId == addressId);
    // var newAddress = Address(
    //     addressId: addressId,
    //     defaultAddress: addressdetail['defaultAddress'],
    //     Flat_FLoor_Tower: addressdetail['Flat_FLoor_Tower'],
    //     Street_Society: addressdetail.Street_Society,
    //     Recipients_Name: addressdetail.Recipients_Name,
    //     City: addressdetail.City,
    //     Pincode: addressdetail.Pincode);
    // var updatedItems = state.AddressBookModel!.addresses.toList();
    // updatedItems.remove(isAddressExist);
    // updatedItems.add(newAddress);
    // AddressBook newbook = AddressBook(addresses: updatedItems);
    // state = state.copyWith(AddressBookModel: newbook);

    await getAddresses(addressdetail["number"]);
  }

  Future<void> setSelectedAddress(userid, addressId) async {
    var data = await _apiService.setSelectedaddress(userid, addressId);

    // var PreviousDefaultAddress = state.AddressBookModel!.addresses
    //     .firstWhere((e) => e.defaultAddress == true);
    // var isAddressExist = state.AddressBookModel!.addresses
    //     .firstWhere((e) => e.addressId == addressId);
    // var updatedItems = state.AddressBookModel!.addresses.toList();
    // var newPreviousAddress = Address(
    //     addressId: PreviousDefaultAddress.addressId,
    //     defaultAddress: false,
    //     Flat_FLoor_Tower: PreviousDefaultAddress.Flat_FLoor_Tower,
    //     Street_Society: PreviousDefaultAddress.Street_Society,
    //     Recipients_Name: PreviousDefaultAddress.Recipients_Name,
    //     City: PreviousDefaultAddress.City,
    //     Pincode: PreviousDefaultAddress.Pincode);
    // var newCurrentAddress = Address(
    //     addressId: isAddressExist.addressId,
    //     defaultAddress: true,
    //     Flat_FLoor_Tower: isAddressExist.Flat_FLoor_Tower,
    //     Street_Society: isAddressExist.Street_Society,
    //     Recipients_Name: isAddressExist.Recipients_Name,
    //     City: isAddressExist.City,
    //     Pincode: isAddressExist.Pincode);
    // updatedItems.remove(PreviousDefaultAddress);
    // updatedItems.remove(isAddressExist);
    // updatedItems.add(newPreviousAddress);
    // updatedItems.add(newCurrentAddress);
    // var newupdatesItems = updatedItems.reversed.toList();
    // AddressBook newbook = AddressBook(addresses: newupdatesItems);
    // state = state.copyWith(AddressBookModel: newbook);

    await getAddresses(userid);
  }

  Future<SelectedAddress?> getSelectedAddress(phonenumber) async {
    var data = await _apiService.fetchselectedaddress(phonenumber);

    return data;
  }
}
