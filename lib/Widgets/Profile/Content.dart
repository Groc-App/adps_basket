// ignore_for_file: deprecated_member_use, avoid_unnecessary_containers, file_names

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:about/about.dart';
import 'package:share_plus/share_plus.dart';

import '../../providers/providers.dart';

class Content extends ConsumerWidget {
  const Content({super.key});

  void navigation(context, navi_url) {
    Navigator.of(context).pushNamed('${navi_url}');
  }

  Widget iconRow(icn, text, context, navi_url, WidgetRef ref) {
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
          } else if (navi_url == 'logout') {
            showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      title: const Text('Logout'),
                      content: const Text('Are you sure?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            FirebaseAuth auth = FirebaseAuth.instance;
                            auth.signOut();
                            ref
                                .read(authCheckProvider.notifier)
                                .update((state) => null);

                            Navigator.pop(context, 'Logout');
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/homepage', (Route<dynamic> route) => false);
                          },
                          child: const Text('Logout'),
                        ),
                      ],
                    ));
          } else if (navi_url == 'share') {
            print("inside tap");
            Share.share(
                'https://play.google.com/store/apps/details?id=com.instructivetech.kidskite');
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
  Widget build(BuildContext context, WidgetRef ref) {
    // Cheching user login info

    var authInfo = ref.watch(authCheckProvider);
    print(authInfo?.uid);

    return Column(
      children: [
        Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'YOUR INFORMATION',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            // Divider(),
            SizedBox(
              height: 10,
            ),
            iconRow(FontAwesomeIcons.shoppingBag, 'Your Orders', context,
                '/yourOrderScreen', ref),
            SizedBox(
              height: 10,
            ),
            iconRow(FontAwesomeIcons.addressBook, 'Your Addresses', context,
                '/addressScreen', ref),
          ]),
        ),
        Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  'OTHER INFORMATION',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                )),
            // Divider(),
            const SizedBox(
              height: 10,
            ),
            iconRow(
                FontAwesomeIcons.share, 'Share the app', context, 'share', ref),

            SizedBox(
              height: 10,
            ),

            iconRow(FontAwesomeIcons.info, 'About us', context, 'about', ref),
            SizedBox(
              height: 10,
            ),
            iconRow(FontAwesomeIcons.star, 'Rate us on Play Store', context,
                '/yourOrderScreen', ref),
            if (authInfo != null)
              iconRow(
                  FontAwesomeIcons.signOut, 'Logout', context, 'logout', ref),
          ]),
        ),
      ],
    );
  }
}
