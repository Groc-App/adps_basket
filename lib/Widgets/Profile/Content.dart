// ignore_for_file: deprecated_member_use, avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Content extends StatelessWidget {
  const Content({super.key});

  Widget iconRow(icn, text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Container(
              margin: const EdgeInsets.only(right: 6),
              child: CircleAvatar(
                radius: 17,
                backgroundColor: Colors.grey[200],
                foregroundColor: Colors.black,
                child: FaIcon(
                  icn,
                  size: 15,
                ),
              ),
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ]),
          Container(
              margin: const EdgeInsets.only(right: 5),
              child: const Icon(
                Icons.navigate_next,
                color: Colors.grey,
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Your Information',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          // Divider(),
          const SizedBox(
            height: 10,
          ),
          iconRow(FontAwesomeIcons.shoppingBag, 'Your Orders'),
          iconRow(FontAwesomeIcons.addressBook, 'Your Addresses'),
        ]),
        Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  'Other Information',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                )),
            // Divider(),
            const SizedBox(
              height: 10,
            ),
            iconRow(FontAwesomeIcons.share, 'Share the app'),
            iconRow(FontAwesomeIcons.info, 'About us'),
            iconRow(FontAwesomeIcons.star, 'Rate us on Play Store'),
            iconRow(FontAwesomeIcons.signOut, 'Logout'),
          ]),
        ),
      ],
    );
  }
}
