// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../providers/providers.dart';

class HeadingSupport extends ConsumerWidget {
  const HeadingSupport({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Cheching user login info

    var authInfo = ref.watch(authCheckProvider);
    print(authInfo?.uid);

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
            authInfo != null
                ? Text('${authInfo.phoneNumber}')
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
                var whatsapp = "918299073956";
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
