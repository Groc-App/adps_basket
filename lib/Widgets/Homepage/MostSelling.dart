import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:your_basket/Widgets/Homepage/ProductItem.dart';

class MostSelling extends StatelessWidget {
  const MostSelling({super.key});

  @override
  Widget build(BuildContext context) {
    final sc_size = MediaQuery.of(context).size;
    final sc_width = sc_size.width;
    final sc_height = sc_size.height;

    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(width: 5),
              bottom: BorderSide(width: 5),
              left: BorderSide(width: 5),
              right: BorderSide(width: 5))),
      height: sc_height,
      child: Column(
        children: [
          Container(
            height: 0.1 * sc_height,
            alignment: Alignment(0, 0),
            // margin: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
            child: Text(
              'Most Selling Products',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ProductItem(),
        ],
      ),
    );
  }
}
