// ignore_for_file: file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CategorySliderItems extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final categoryName;
  // ignore: prefer_typing_uninitialized_variables
  final catergoryURL;

  const CategorySliderItems(this.categoryName, this.catergoryURL, {super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(children: [
            Container(
              margin: EdgeInsets.all(8),
              width: 50,
              height: 50,
              alignment: Alignment.center,
              child: Image.network(
                'https://swarajdairy.com/images/all_bakery_products.png',
                height: 50,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Milk And Bakery",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ]),
        ));
  }
}
