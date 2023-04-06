// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OrderFailure extends StatelessWidget {
  const OrderFailure({super.key});

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;

    var successTypeMap = (ModalRoute.of(context)?.settings.arguments ??
        <String, String>{}) as Map;
    var successType = successTypeMap['type'];

    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CachedNetworkImage(
            fadeInDuration: const Duration(milliseconds: 50),
            imageUrl:
                'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Screens%2ForderFailure%2ForderFailure.png?alt=media&token=e5a0b523-ff34-4efd-be38-056fee96a50e',
            height: scHeight * 0.4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                successType == 'order'
                    ? const Text(
                        'OOPS!!!, Some error occured, Could not place order',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      )
                    : const Text(
                        'OOPS!!!, Some error occured, Could not create subscription',
                        style: TextStyle(fontSize: 20),
                      ),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  'Please try again later',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/homepage', (Route<dynamic> route) => false);
              },
              child: const Text('Try again')),
        ]),
      ),
    );
  }
}
