// ignore_for_file: deprecated_member_use, avoid_unnecessary_containers, file_names

import 'package:cached_network_image/cached_network_image.dart';
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

  Widget iconRow(icn, text, context, navi_url, WidgetRef ref, String? number) {
    return GestureDetector(
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
                'Basko is delivery app which delivers grocery items to your door steps in no time.'),
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
            applicationIcon: SizedBox(
              width: 100,
              height: 100,
              child: CachedNetworkImage(
                  imageUrl:
                      'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Logo%2Flogo.png?alt=media&token=bde72ad0-a31b-405c-911c-6a45e258b6db'),
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
            ),
          );
        } else if (navi_url == 'share') {
          print("inside tap");
          Share.share(
              'https://play.google.com/store/apps/details?id=com.instructivetech.kidskite');
        } else if (navi_url == '/referearnScreen') {
          Navigator.of(context)
              .pushNamed('${navi_url}', arguments: {'number': number});
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
                margin: EdgeInsets.only(right: 9),
                child: CircleAvatar(
                  radius: 17,
                  backgroundColor: Colors.white38,
                  foregroundColor: Theme.of(context).primaryColor,
                  child: FaIcon(
                    icn,
                    size: 17,
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
              style: TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 121, 117, 117)),
            ),
            // Divider(),
            SizedBox(
              height: 10,
            ),
            iconRow(FontAwesomeIcons.shoppingBag, 'Your Orders', context,
                '/yourOrderScreen', ref, authInfo?.phoneNumber),
            SizedBox(
              height: 3,
            ),
            iconRow(FontAwesomeIcons.solidAddressBook, 'Your Addresses',
                context, '/addressScreen', ref, authInfo?.phoneNumber),
          ]),
        ),
        Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  'OTHER INFORMATION',
                  style: TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 121, 117, 117)),
                )),
            // Divider(),
            const SizedBox(
              height: 12,
            ),
            iconRow(FontAwesomeIcons.share, 'Refer and Earn', context,
                '/referearnScreen', ref, authInfo?.phoneNumber),

            SizedBox(
              height: 3,
            ),
            iconRow(FontAwesomeIcons.shareNodes, 'Share the app', context,
                'share', ref, authInfo?.phoneNumber),

            SizedBox(
              height: 3,
            ),

            iconRow(FontAwesomeIcons.info, 'About us', context, 'about', ref,
                authInfo?.phoneNumber),
            SizedBox(
              height: 3,
            ),
            iconRow(FontAwesomeIcons.solidStar, 'Rate us on Play Store',
                context, '/yourOrderScreen', ref, authInfo?.phoneNumber),
            SizedBox(
              height: 3,
            ),
            if (authInfo != null)
              iconRow(FontAwesomeIcons.rightFromBracket, 'Logout', context,
                  'logout', ref, authInfo.phoneNumber),
          ]),
        ),
      ],
    );
  }
}
