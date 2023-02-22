import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

class OrderSuuccess extends StatelessWidget {
  const OrderSuuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;

    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Lottie.network(
              'https://assets5.lottiefiles.com/packages/lf20_jbrw3hcz.json',
              height: scHeight * 0.4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Order Placed Successfully',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                'It will be delivered by 8 AM tommorrow',
                style: TextStyle(fontSize: 14, color: Colors.grey),
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
              child: Text('Continue Shopping')),
        ]),
      ),
    );
  }
}
