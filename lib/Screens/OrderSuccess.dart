import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

class OrderSuuccess extends StatelessWidget {
  OrderSuuccess({super.key});

  @override
  Widget build(BuildContext context) {
    print("Inside order success");
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;

    var successTypeMap = (ModalRoute.of(context)?.settings.arguments ??
        <String, String>{}) as Map;
    var successType = successTypeMap['type'];
    print("Success Type::::::: $successType");

    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Lottie.network(
              'https://assets5.lottiefiles.com/packages/lf20_jbrw3hcz.json',
              height: scHeight * 0.4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              successType == 'order'
                  ? Text(
                      'Order Placed Successfully',
                      style: TextStyle(fontSize: 20),
                    )
                  : Text(
                      'Subscription Created Successfully',
                      style: TextStyle(fontSize: 20),
                    ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/homepage', (Route<dynamic> route) => false);
              },
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.green[400]),
              child: Text('Continue Shopping')),
        ]),
      ),
    );
  }
}
