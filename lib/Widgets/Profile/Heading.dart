// ignore_for_file: file_names

// import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../providers/providers.dart';

String userNumber = '';

class HeadingSupport extends ConsumerStatefulWidget {
  const HeadingSupport({Key? key}) : super(key: key);

  @override
  _HeadingSupportState createState() => _HeadingSupportState();
}

class _HeadingSupportState extends ConsumerState<HeadingSupport> {
  // const HeadingSupport({super.key});

  @override
  void initState() {
    // TODO: implement initState
    // foundUser = data;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
// your code goes here
      await getNumber();

      // ref.invalidate(verifyCouponProvider);
    });
  }

  Future<void> getNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userNumberr = prefs.getString('username') ?? '';
    setState(() {
      userNumber = userNumberr;
    });
    print("userNumber $userNumber");
  }

  @override
  Widget build(BuildContext context) {
    // Cheching user login info

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
            userNumber != ''
                ? Text('${userNumber}')
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
              var whatsapp = "${userNumber}";
              var whatsappAndroid =
                  Uri.parse("whatsapp://send?phone=$whatsapp&text=hello");
              if (await canLaunchUrl(whatsappAndroid)) {
                await launchUrl(whatsappAndroid);
              } else {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("WhatsApp is not installed on the device"),
                  ),
                );
              }
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
