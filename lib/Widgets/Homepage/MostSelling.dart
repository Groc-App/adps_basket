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
      height: sc_height * 0.9,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
            child: Text(
              'Most Selling Products',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: 5),
                    bottom: BorderSide(width: 5),
                    left: BorderSide(width: 5),
                    right: BorderSide(width: 5))),
            height: sc_height * 0.75,
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
                      child: Column(children: [
                        Container(
                          height: sc_width * 0.25,
                          child: Image.network(
                            'https://m.media-amazon.com/images/I/812816L+HkL._SL1500_.jpg',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Text('Amul Toned Milk'),
                        Text('500 ml'),
                        Row(
                          children: [
                            Text('Price'),
                            OutlinedButton(
                                onPressed: () {}, child: Text('ADD')),
                          ],
                        )
                      ]),
                    ),
                  );
                  ;
                }),
          ),
        ],
      ),
    );
  }
}
