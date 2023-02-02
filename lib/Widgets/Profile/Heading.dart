import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HeadingSupport extends StatelessWidget {
  const HeadingSupport({super.key});

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Text(
                'My Account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Text('7982733943'),
          ]),
          Column(
            children: [
              Icon(
                Icons.call,
                size: 20,
              ),
              Text('Support')
            ],
          ),
        ],
      ),
    );
  }
}
