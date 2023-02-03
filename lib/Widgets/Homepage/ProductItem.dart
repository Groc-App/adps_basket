// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool added = false;
  var counter = 1;

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scWidth = scSize.width;

    void incrementHandler() {
      setState(() {
        counter++;
      });
    }

    void decrementHandler() {
      if (counter == 1) {
        setState(() {
          added = false;
        });
      } else {
        setState(() {
          counter--;
        });
      }
    }

    return Card(
      color: Colors.amber,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          flex: 3,
          child: Image.network(
            'https://e7.pngegg.com/pngimages/195/186/png-clipart-buttermilk-cream-mother-dairy-dairy-products-milk-cream-food.png',
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Column(
              children: const [
                Text(
                  'Amul Toned Milk',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '500 ml',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  width: scWidth * 0.48 * 0.18,
                  child:
                      FittedBox(fit: BoxFit.fill, child: const Text('23\$'))),
              added == true
                  ? Container(
                      width: scWidth * 0.48 * 0.36,
                      height: scWidth * 0.48 * 0.16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              child: Icon(Icons.remove,
                                  size: scWidth * 0.48 * 0.36 * 0.2),
                              onTap: () => decrementHandler(),
                            ),
                          ),
                          Text('$counter'),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              child: Icon(Icons.add,
                                  size: scWidth * 0.48 * 0.36 * 0.2),
                              onTap: () => incrementHandler(),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      width: scWidth * 0.48 * 0.38,
                      child: FittedBox(
                        child: OutlinedButton(
                            onPressed: () {
                              setState(() {
                                added = true;
                              });
                            },
                            child: const Text('ADD')),
                      ),
                    ),
            ],
          ),
        )
      ]),
    );
  }
}
