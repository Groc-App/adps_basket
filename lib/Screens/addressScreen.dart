import 'package:flutter/material.dart';
import 'package:your_basket/Widgets/Address/address.dart';

class AddressBook extends StatelessWidget {
  const AddressBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* --------------------------------- appBar --------------------------------- */
      appBar: AppBar(
          elevation: 7,
          // ignore: prefer_const_constructors
          leading: Icon(Icons.arrow_back),
          title: const Text(
            "My Addresses",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          backgroundColor: const Color.fromARGB(255, 243, 243, 243)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            /* -------------------------------------------------------------------------- */
            child: GestureDetector(
              onTap: (() {}),
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
            // Divider()
          ),
          const Divider(),
          /* -------------------------------------------------------------------------- */
          const Address(),
          const Divider(),
          const Address(),
          const Divider(),
          const Address(),
          const Divider()
        ]),
      ),
    );
  }
}
