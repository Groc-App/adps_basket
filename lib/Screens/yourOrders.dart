// ignore: file_names
// ignore: file_names
// ignore_for_file: implementation_imports, file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:your_basket/Widgets/YourOrderes/OrdereItem.dart';

class YourOrderes extends StatelessWidget {
  YourOrderes({super.key});

  final yourOrderList = [];

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 230, 230),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Your Orders'),
      ),
      body: yourOrderList.isNotEmpty
          ? Column(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: yourOrderList.map((e) {
                      return const OrdereItem();
                    }).toList(),
                  ),
                ),
              ],
            )
          : Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                        height: scHeight * 0.4,
                        'https://www.pngfind.com/pngs/m/88-881210_thug-life-pug-transparent-background-png-sad-dog.png'),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text(
                        'OPPS, you have no past orderes!!!',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/homepage', (Route<dynamic> route) => false);
                        },
                        child: const Text('Shop Now')),
                  ]),
            ),
    );
  }
}
