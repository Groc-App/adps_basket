// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:your_basket/Widgets/Homepage/ProductItem.dart';

class MostSelling extends StatelessWidget {
  const MostSelling({super.key});

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scWidth = scSize.width;
    final scHeight = scSize.height;

    return Container(
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(width: 5),
              bottom: BorderSide(width: 5),
              left: BorderSide(width: 5),
              right: BorderSide(width: 5))),
      height: scHeight * 0.9,
      child: Column(
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
          Expanded(
            // decoration: BoxDecoration(
            //     border: Border(
            //         top: BorderSide(width: 5),
            //         bottom: BorderSide(width: 5),
            //         left: BorderSide(width: 5),
            //         right: BorderSide(width: 5))),
            // height: sc_height * 0.78,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 0.7),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(width: 5),
                            bottom: BorderSide(width: 5),
                            left: BorderSide(width: 5),
                            right: BorderSide(width: 5))),
                    child: ProductItem(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
