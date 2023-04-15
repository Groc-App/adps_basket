// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NoItems extends StatelessWidget {
  // const NoItems({super.key});
  final noitemtext;
  final pageroute;

  const NoItems({super.key, this.noitemtext, this.pageroute});

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        noitemtext == 'Login/SignUp First'
            ? CachedNetworkImage(
                fadeInDuration: const Duration(milliseconds: 50),
                fadeInCurve: Curves.bounceIn,
                height: scHeight * 0.4,
                imageUrl:
                    'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Screens%2FNoItem%2Floginfirst2.png?alt=media&token=6d8fd382-93b3-4031-966d-85291540d926')
            : Container(
                margin: const EdgeInsets.only(top: 200),
                child: CachedNetworkImage(
                    fadeInDuration: const Duration(milliseconds: 50),
                    height: scHeight * 0.4,
                    imageUrl:
                        'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Screens%2FNoItem%2Femptylist.png?alt=media&token=4f834d3f-2064-47a3-b9c6-9dce502aa65e'),
              ),
        // SizedBox(
        //   height: 20,
        // ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            '$noitemtext',
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        pageroute == 'loginpage'
            ? ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 5, backgroundColor: Colors.green[400]),
                onPressed: () {
                  Navigator.of(context).pushNamed('/loginScreen');
                },
                child: const Text('Login'))
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor),
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/homepage', (Route<dynamic> route) => false);
                },
                child: const Text('Shop Now')),
        const SizedBox(
          height: 40,
        )
      ]),
    );
  }
}
