// ignore_for_file: file_names, library_private_types_in_public_api, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_basket/Widgets/Address/address.dart';
import '../Widgets/Cart/Noitems.dart';
import '../Widgets/Sinners/addresssinner.dart';
import '../config.dart';
import '../providers/providers.dart';
// ignore: library_prefixes
import '../models/address/address.dart' as AddressModel;

String phonenumber = '';

class AddressBook extends ConsumerStatefulWidget {
  const AddressBook({Key? key}) : super(key: key);

  @override
  _AddressBookState createState() => _AddressBookState();
}

class _AddressBookState extends ConsumerState<AddressBook> {
  // AddressBook({super.key});

  bool _showCheckfield = false;
  bool _checked = false;
  bool _correct = false;
  TextEditingController _pincodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> getNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userNumberr = prefs.getString('username') ?? '';
    setState(() {
      phonenumber = userNumberr;
    });
  }

  Widget _addressList(WidgetRef ref, String phonenumber) {
    final AddressBookState = ref.watch(addressBokkProvider(phonenumber));

    if (AddressBookState.AddressBookModel == null) {
      return const Column(
        children: [
          AddressSinner(),
          SizedBox(height: 10),
          AddressSinner(),
          SizedBox(height: 10),
          AddressSinner(),
          SizedBox(height: 10),
        ],
      );
    }

    if (AddressBookState.AddressBookModel!.addresses.isEmpty) {
      return const Center(
        child: Text('No Address Found'),
      );
    }

    return _buildAddressList(
        AddressBookState.AddressBookModel!.addresses
            .cast<AddressModel.Address>(),
        phonenumber);
  }

  Widget _buildAddressList(
      List<AddressModel.Address>? list, String phonenumber) {
    return Column(
      children: list!.map((value) {
        return Column(
          children: [
            Address(data: value, userId: phonenumber, bottomsheet: bottomsheet),
            const Divider(),
          ],
        );
      }).toList(),
    );
  }

  void bottomsheet(WidgetRef ref, BuildContext context, String phonenumber,
      double scHeight, String functionality, String addressId) {
    final formKey = GlobalKey<FormState>();
    String? name, flatnumber, society, city, pincode;

    showModalBottomSheet(
        isScrollControlled: true,
        enableDrag: true,
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: scHeight * 0.7,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 10,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: const Text(
                            'Enter Details',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            onSaved: (value) => name = value,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Recepient\'s name',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Name';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            onSaved: (value) => flatnumber = value,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Flat/House number',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Flat/House Number';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            onSaved: (value) => society = value,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Street/Society',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Street/Society';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            onSaved: (value) => city = value,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'City',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter City';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            onSaved: (value) => pincode = value,
                            maxLength: 6,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Pincode',
                            ),
                            validator: (value) {
                              if (value == null || value.length != 6) {
                                return 'Please enter correct Pincode';
                              } else if (Config.availpincode.contains(value) ==
                                  false) {
                                return 'Sorry, we are not available in this area right now.';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                Map<String, String?> mp = {
                                  "number": phonenumber,
                                  "Recipients_Name": name,
                                  "Flat_FLoor_Tower": flatnumber,
                                  "Street_Society": society,
                                  "City": city,
                                  "Pincode": pincode
                                };

                                if (functionality == 'addAddress') {
                                  final addressModel = ref.read(
                                      addressBokkProvider(phonenumber)
                                          .notifier);
                                  addressModel
                                      .addNewAddress(mp)
                                      .whenComplete(() {
                                    Navigator.pop(context);
                                  });
                                } else if (functionality == 'updateAddress') {
                                  final addressModel = ref.read(
                                      addressBokkProvider(phonenumber)
                                          .notifier);
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
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;

    getNumber();

    return Scaffold(
      /* --------------------------------- appBar --------------------------------- */
      appBar: AppBar(
        title: const Text(
          "My Addresses",
        ),
      ),
      body: phonenumber == ''
          ? const NoItems(
              noitemtext: 'Login/SignUp First',
              pageroute: 'loginpage',
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: Config.scHeight -
                    (MediaQuery.of(context).padding.top + kToolbarHeight) -
                    20,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    /* -------------------------------------------------------------------------- */
                    child: GestureDetector(
                      onTap: (() {
                        bottomsheet(ref, context, phonenumber, scHeight,
                            'addAddress', '');
                      }),
                      child: Row(
                        children: [
                          const Icon(Icons.add),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Add New Address",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  /* -------------------------------------------------------------------------- */
                  _addressList(ref, phonenumber),
                  const Spacer(),
                  _showCheckfield
                      ? Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 7),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _pincodeController,
                                maxLength: 6,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Enter Pincode',
                                ),
                                validator: (value) {
                                  if (value == null || value.length != 6) {
                                    return 'Please enter correct Pincode';
                                  }
                                  return null;
                                },
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: ((Config.scWidth * 0.5) - 95)),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          FocusScope.of(context).unfocus();

                                          if (Config.availpincode.contains(
                                              _pincodeController.text)) {
                                            setState(() {
                                              _correct = true;
                                              _checked = true;
                                              _showCheckfield = false;
                                            });
                                          } else {
                                            setState(() {
                                              _correct = false;
                                              _checked = true;
                                              _showCheckfield = false;
                                            });
                                          }
                                        },
                                        child:
                                            const Text('Check Availability')),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _showCheckfield = false;
                                        });
                                      },
                                      child: const Icon(
                                        FontAwesomeIcons.xmark,
                                        size: 17,
                                      )),
                                ],
                              )
                            ],
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.delivery_dining_rounded),
                              const SizedBox(
                                width: 8,
                              ),
                              _checked
                                  ? _correct
                                      ? Text(
                                          'Yayy, service available',
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        )
                                      : const Text(
                                          'Sorry, service unavailable',
                                          style: TextStyle(color: Colors.red),
                                        )
                                  : const Text('Check available delivery'),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _showCheckfield = true;
                                  });
                                },
                                child: Text(
                                  _checked ? 'Check other' : 'Check',
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 12),
                                ),
                              )
                            ],
                          ),
                        ),
                ]),
              ),
            ),
    );
  }
}
