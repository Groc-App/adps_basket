// ignore_for_file: file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CategorySliderItems extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final String categoryName;
  // ignore: prefer_typing_uninitialized_variables
  final catergoryURL;

  void tapHandler() {
    print("Tapped tapped");
  }

  const CategorySliderItems(this.categoryName, this.catergoryURL, {super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          tapHandler();
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(children: [
            Container(
              margin: const EdgeInsets.all(8),
              width: 50,
              height: 50,
              alignment: Alignment.center,
              child: Image.network(
                catergoryURL,
                height: 50,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  categoryName,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ]),
        ));
  }
}
