import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CopyRightSymbol extends StatelessWidget {
  const CopyRightSymbol({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
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
