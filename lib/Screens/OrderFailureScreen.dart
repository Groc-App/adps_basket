import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

class OrderFailure extends StatelessWidget {
  OrderFailure({super.key});

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;

    var successTypeMap = (ModalRoute.of(context)?.settings.arguments ??
        <String, String>{}) as Map;
    var successType = successTypeMap['type'];
    print("Success Type::::::: $successType");

    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CachedNetworkImage(
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
                    ? Text(
                        'OOPS!!!, Some error occured, Could not place order',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      )
                    : Text(
                        'OOPS!!!, Some error occured, Could not create subscription',
                        style: TextStyle(fontSize: 20),
                      ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  'Please try again later',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/homepage', (Route<dynamic> route) => false);
              },
              child: Text('Try again')),
        ]),
      ),
    );
  }
}
