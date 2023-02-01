// ignore: file_names
import 'package:flutter/material.dart';

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
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(width: 5),
                    bottom: BorderSide(width: 5),
                    left: BorderSide(width: 5),
                    right: BorderSide(width: 5))),
            height: scHeight * 0.75,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 0.7),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(width: 5),
                            bottom: BorderSide(width: 5),
                            left: BorderSide(width: 5),
                            right: BorderSide(width: 5))),
                    child: Card(
                      color: Colors.amber,
                      child: Column(children: [
                        SizedBox(
                          height: scWidth * 0.25,
                          child: Image.network(
                            'https://m.media-amazon.com/images/I/812816L+HkL._SL1500_.jpg',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        const Text('Amul Toned Milk'),
                        const Text('500 ml'),
                        Row(
                          children: [
                            const Text('Price'),
                            OutlinedButton(
                                onPressed: () {}, child: const Text('ADD')),
                          ],
                        )
                      ]),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
