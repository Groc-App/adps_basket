import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
    final sc_size = MediaQuery.of(context).size;
    final sc_width = sc_size.width;
    final sc_height = sc_size.height;

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
        Container(
          height: sc_width * 0.28,
          child: Image.network(
            'https://m.media-amazon.com/images/I/812816L+HkL._SL1500_.jpg',
            fit: BoxFit.fitWidth,
          ),
        ),
        Column(
          children: [
            Text('Amul Toned Milk'),
            Text('500 ml'),
          ],
        ),
        Container(
          margin: EdgeInsets.only(bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Price'),
              added == true
                  ? Container(
                      width: sc_width * 0.28 * 0.36,
                      height: sc_width * 0.28 * 0.16,
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
                                  size: sc_width * 0.28 * 0.15 * 0.7),
                              onTap: () => decrementHandler(),
                            ),
                          ),
                          Text('${counter}'),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              child: Icon(Icons.add,
                                  size: sc_width * 0.28 * 0.15 * 0.7),
                              onTap: () => incrementHandler(),
                            ),
                          ),
                        ],
                      ),
                    )
                  : OutlinedButton(
                      onPressed: () {
                        setState(() {
                          added = true;
                        });
                        print(added);
                      },
                      child: Text('ADD')),
            ],
          ),
        )
      ]),
    );
  }
}
