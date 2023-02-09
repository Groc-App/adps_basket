import 'package:flutter/material.dart';

class NoItems extends StatelessWidget {
  // const NoItems({super.key});
  final noitemtext;

  NoItems({this.noitemtext});

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;

    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.network(
            height: scHeight * 0.4,
            'https://www.pngfind.com/pngs/m/88-881210_thug-life-pug-transparent-background-png-sad-dog.png'),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            '$noitemtext',
            style: TextStyle(fontSize: 20),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/homepage', (Route<dynamic> route) => false);
            },
            child: const Text('Shop Now')),
      ]),
    );
  }
}
