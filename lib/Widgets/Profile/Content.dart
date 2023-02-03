import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:about/about.dart';

class Content extends StatelessWidget {
  const Content({super.key});

  void navigation(context, navi_url) {
    Navigator.of(context).pushNamed('${navi_url}');
  }

  Widget iconRow(icn, text, context, navi_url) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (navi_url == 'about') {
            showAboutPage(
              context: context,
              values: {
                'version': '1.0',
                'year': DateTime.now().year.toString(),
              },
              applicationLegalese: 'Copyright © ADPS, {{ year }}',
              applicationDescription: const Text(
                  'Displays an About dialog, which describes the application.'),
              children: const <Widget>[
                MarkdownPageListTile(
                  icon: Icon(Icons.list),
                  title: Text('Changelog'),
                  filename: 'CHANGELOG.md',
                ),
                LicensesPageListTile(
                  icon: Icon(Icons.favorite),
                ),
              ],
              applicationIcon: const SizedBox(
                width: 100,
                height: 100,
                child: Image(
                  image: AssetImage('assets/icon.webp'),
                ),
              ),
            );
          } else {
            navigation(context, navi_url);
          }
        },
        child: Container(
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
        ),
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
            iconRow(FontAwesomeIcons.shoppingBag, 'Your Orders', context,
                '/yourOrderScreen'),
            iconRow(FontAwesomeIcons.addressBook, 'Your Addresses', context,
                '/yourOrderScreen'),
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
            iconRow(FontAwesomeIcons.share, 'Share the app', context, 'share'),
            iconRow(FontAwesomeIcons.info, 'About us', context, 'about'),
            iconRow(FontAwesomeIcons.star, 'Rate us on Play Store', context,
                '/yourOrderScreen'),
            iconRow(FontAwesomeIcons.signOut, 'Logout', context,
                '/yourOrderScreen'),
          ]),
        ),
      ],
    );
  }
}
