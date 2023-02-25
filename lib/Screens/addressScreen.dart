import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Widgets/Address/address.dart';
import '../providers/providers.dart';
import '../models/address/address.dart' as AddressModel;

class AddressBook extends ConsumerWidget {
  AddressBook({super.key});

  Widget _addressList(WidgetRef ref) {
    final AddressBookState = ref.watch(addressBokkProvider);

    if (AddressBookState.AddressBookModel == null) {
      return const LinearProgressIndicator();
    }

    if (AddressBookState.AddressBookModel!.addresses.isEmpty) {
      return Center(
        child: Text('No Address Found'),
      );
    }

    print('dobara bani hhhhhhhhhhhhhhhhhhh\n');
    print(AddressBookState.AddressBookModel!.addresses);

    return _buildAddressList(AddressBookState.AddressBookModel!.addresses
        .cast<AddressModel.Address>());
  }

  Widget _buildAddressList(List<AddressModel.Address>? list) {
    return Column(
      children: list!.map((value) {
        return Column(
          children: [
            Address(
                data: value, userId: '+917982733943', bottomsheet: bottomsheet),
            Divider(),
          ],
        );
      }).toList(),
    );
  }

  void bottomsheet(WidgetRef ref, BuildContext context, String phonenumber,
      double scHeight, String functionality, String addressId) {
    final _formKey = GlobalKey<FormState>();
    String? name, flatnumber, society, city, pincode;

    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: scHeight * 0.7,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Enter Details',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            onSaved: (value) => name = value,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Recepient\'s name',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            onSaved: (value) => flatnumber = value,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Flat/House number',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            onSaved: (value) => society = value,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Street/Society',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            onSaved: (value) => city = value,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'City',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            onSaved: (value) => pincode = value,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Pincode',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                Map<String, String?> mp = {
                                  "number": phonenumber,
                                  "Recipients_Name": name,
                                  "Flat_FLoor_Tower": flatnumber,
                                  "Street_Society": society,
                                  "City": city,
                                  "Pincode": pincode
                                };

                                if (functionality == 'addAddress') {
                                  final addressModel =
                                      ref.read(addressBokkProvider.notifier);
                                  addressModel
                                      .addNewAddress(mp)
                                      .whenComplete(() {
                                    Navigator.pop(context);
                                  });
                                } else if (functionality == 'updateAddress') {
                                  final addressModel =
                                      ref.read(addressBokkProvider.notifier);
                                  addressModel
                                      .updateAddress(mp, addressId)
                                      .whenComplete(() {
                                    Navigator.pop(context);
                                  });
                                }
                              }
                            },
                            child: const Text('Submit'),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;

    // var authInfo = ref.watch(authCheckProvider);
    // print(authInfo?.uid);

    return Scaffold(
      /* --------------------------------- appBar --------------------------------- */
      appBar: AppBar(
          elevation: 7,
          title: const Text(
            "My Addresses",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          backgroundColor: const Color.fromARGB(255, 243, 243, 243)),
      body:
          // authInfo == null
          //     ?
          // NoItems(
          //     noitemtext: 'Login/Signup first',
          //     pageroute: 'loginpage',
          //   )
          // :
          SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            /* -------------------------------------------------------------------------- */
            child: GestureDetector(
              onTap: (() {
                bottomsheet(
                    ref, context, '+917982733943', scHeight, 'addAddress', '');
              }),
              child: const Row(
                children: [
                  Icon(Icons.add),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Add New Address",
                    style: TextStyle(color: Color.fromARGB(255, 18, 180, 23)),
                  )
                ],
              ),
            ),
          ),
          const Divider(),
          /* -------------------------------------------------------------------------- */
          _addressList(ref),
        ]),
      ),
    );
  }
}
