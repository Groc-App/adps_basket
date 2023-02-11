import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Widgets/Address/address.dart';

import '../Widgets/Cart/Noitems.dart';
import '../providers/providers.dart';

class AddressBook extends ConsumerWidget {
  AddressBook({super.key});

  var savedAdresses = [{}, {}, {}, {}];

  void bottomsheet(context, scHeight) {
    final _formKey = GlobalKey<FormState>();
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
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')),
                                );
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

    var authInfo = ref.watch(authCheckProvider);
    print(authInfo?.uid);

    return Scaffold(
      /* --------------------------------- appBar --------------------------------- */
      appBar: AppBar(
          elevation: 7,
          title: const Text(
            "My Addresses",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          backgroundColor: const Color.fromARGB(255, 243, 243, 243)),
      body: authInfo == null
          ? NoItems(
              noitemtext: 'Login/Signup first',
              pageroute: 'loginpage',
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  /* -------------------------------------------------------------------------- */
                  child: GestureDetector(
                    onTap: (() {
                      bottomsheet(context, scHeight);
                    }),
                    child: const Row(
                      children: [
                        Icon(Icons.add),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Add New Address",
                          style: TextStyle(
                              color: Color.fromARGB(255, 18, 180, 23)),
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(),
                /* -------------------------------------------------------------------------- */

                Column(
                  children: savedAdresses.map((index) {
                    return Column(
                      children: [
                        Address(),
                        Divider(),
                      ],
                    );
                  }).toList(),
                ),
              ]),
            ),
    );
  }
}
