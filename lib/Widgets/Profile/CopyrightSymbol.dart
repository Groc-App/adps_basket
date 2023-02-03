// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CopyRightSymbol extends StatelessWidget {
  const CopyRightSymbol({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        Center(
          child: Text(
            'adps',
            style: TextStyle(fontSize: 24, color: Colors.grey),
          ),
        ),
        Center(
          child: Text(
            'v10.00.01',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        )
      ],
    );
  }
}
