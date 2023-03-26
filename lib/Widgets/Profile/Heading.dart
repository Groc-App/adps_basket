// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config.dart';
import '../../providers/providers.dart';

String phonenumber = '';

class HeadingSupport extends ConsumerWidget {
  HeadingSupport({super.key});

  Future<void> setnumber() async {
    print('called');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = await prefs.getString('username');
    print('$username');
    if (username != null) {
      phonenumber = username;
      print('phonenumber is: $phonenumber');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Cheching user login info

    // var authInfo = ref.watch(authCheckProvider);
    // print(authInfo);

    setnumber();

    // print('phonenumber inside build is: ${Config.phonenumber}');
    print('phonenumber inside build is: ${phonenumber}');

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Text(
                'My Account',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            // authInfo != null
            // Config.phonenumber != null
            phonenumber != ''
                // ? Text('${Config.phonenumber}')
                ? Text('${phonenumber}')
                : GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/loginScreen');
                    },
                    child: Text(
                      'LogIn to view Profile',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w500),
                    ),
                  ),
          ]),
          GestureDetector(
            onTap: () async {
              try {
                var whatsapp = "917988923447";
                var url = "https://wa.me/$whatsapp?text=Hi, There!";

                await launch(url);
              } catch (e) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                        "WhatsApp is not installed on the device or some error"),
                  ),
                );
              }

              // var whatsappAndroid =
              //     Uri.parse("whatsapp://send?phone=$whatsapp?text=Your");
              // if (await canLaunchUrl(whatsappAndroid)) {
              // } else {
              //   ScaffoldMessenger.of(context).hideCurrentSnackBar();
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     const SnackBar(
              //       content: Text("WhatsApp is not installed on the device"),
              //     ),
              //   );
              // }
            },
            child: Column(
              children: [
                Icon(
                  FontAwesomeIcons.phone,
                  size: 20,
                  color: Theme.of(context).primaryColor,
                ),
                Text('Support')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
