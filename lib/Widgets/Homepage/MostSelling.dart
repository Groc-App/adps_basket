// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:your_basket/Widgets/Homepage/ProductItem.dart';

class MostSelling extends StatelessWidget {
  const MostSelling({super.key});

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;
    final scWidth = scSize.width;
    final tempHeight = scWidth * 0.48 / 0.7 * 3;

    return Container(
      // height: scWidth * 0.48 / 0.7 * 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
            child: const Text(
              'Most Selling Products',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: scWidth * ((0.48 / 0.7) * 3) + 20,
            child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 5),
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      // decoration: const BoxDecoration(
                      //     border: Border(
                      //         top: BorderSide(width: 5),
                      //         bottom: BorderSide(width: 5),
                      //         left: BorderSide(width: 5),
                      //         right: BorderSide(width: 5))),

                      // child: ProductItem(),
                      );
                }),
          ),
        ],
      ),
    );
  }
}
