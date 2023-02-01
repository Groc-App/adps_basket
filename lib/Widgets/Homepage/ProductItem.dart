import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    final sc_size = MediaQuery.of(context).size;
    final sc_width = sc_size.width;
    final sc_height = sc_size.height;

    bool added = false;

    @override
    void initState() {
      super.initState();
      added = false;
    }

    @override
    void dispose() {
      super.dispose();
    }

    return Expanded(
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
              child: Card(
                color: Colors.amber,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Price'),
                          added == true
                              ? Container(
                                  width: sc_width * 0.28 * 0.35,
                                  height: sc_width * 0.28 * 0.15,
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(Icons.add,
                                          size: sc_width * 0.28 * 0.15 * 0.7),
                                      Text('1'),
                                      Icon(Icons.add,
                                          size: sc_width * 0.28 * 0.15 * 0.7),
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
                      )
                    ]),
              ),
            );
          }),
    );
  }
}
