// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OrderSuuccess extends StatelessWidget {
  const OrderSuuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;

    var successTypeMap = (ModalRoute.of(context)?.settings.arguments ??
        <String, String>{}) as Map;
    var successType = successTypeMap['type'];

    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/homepage', (Route<dynamic> route) => false);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.green[400],
        body: Padding(
          padding: const EdgeInsets.only(top: 200.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Lottie.network(
                'https://assets5.lottiefiles.com/packages/lf20_jbrw3hcz.json',
                height: scHeight * 0.40),
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                successType == 'order'
                    ? const Text(
                        'Order Placed Successfully !',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      )
                    : const Text(
                        'Subscription Created Successfully',
                        style: TextStyle(fontSize: 20),
                      ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/homepage', (Route<dynamic> route) => false);
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: const Text(
                    'Continue Shopping',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}
