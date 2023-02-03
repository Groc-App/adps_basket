// ignore_for_file: file_names

import 'package:flutter/material.dart';

class HeadingSupport extends StatelessWidget {
  const HeadingSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: const Text(
                'My Account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const Text('7982733943'),
          ]),
          Column(
            children: const [
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
