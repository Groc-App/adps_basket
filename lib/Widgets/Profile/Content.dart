import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Content extends StatelessWidget {
  const Content({super.key});

  Widget iconRow(icn, text) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Container(
              margin: EdgeInsets.only(right: 6),
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
              style: TextStyle(fontSize: 16),
            ),
          ]),
          Container(
              margin: EdgeInsets.only(right: 5),
              child: Icon(
                Icons.navigate_next,
                color: Colors.grey,
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;

    return Column(
      children: [
        Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Your Information',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            // Divider(),
            SizedBox(
              height: 10,
            ),
            iconRow(FontAwesomeIcons.shoppingBag, 'Your Orders'),
            iconRow(FontAwesomeIcons.addressBook, 'Your Addresses'),
          ]),
        ),
        Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  'Other Information',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                )),
            // Divider(),
            SizedBox(
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
