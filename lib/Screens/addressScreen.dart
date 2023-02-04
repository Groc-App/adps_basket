import 'package:flutter/material.dart';
import 'package:your_basket/Widgets/Address/address.dart';

class AddressBook extends StatelessWidget {
  AddressBook({super.key});

  var savedAdresses = [{}, {}, {}, {}];

  void bottomsheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 400,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* --------------------------------- appBar --------------------------------- */
      appBar: AppBar(
          elevation: 7,
          title: const Text(
            "My Addresses",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          backgroundColor: const Color.fromARGB(255, 243, 243, 243)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            /* -------------------------------------------------------------------------- */
            child: GestureDetector(
              onTap: (() {
                bottomsheet(context);
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
