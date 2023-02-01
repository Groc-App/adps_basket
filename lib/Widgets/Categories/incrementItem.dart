import 'dart:developer';

import 'package:flutter/material.dart';

class IncrementItem extends StatefulWidget {
  const IncrementItem({super.key});

  @override
  State<IncrementItem> createState() => _incrementItemState();
}

// ignore: camel_case_types
class _incrementItemState extends State<IncrementItem> {
  // const incrementItem({super.key});
  var counter = 1;

  @override
  Widget build(BuildContext context) {
    /* ------------------- To INcrement and Decrement Counter ------------------- */
    void incrementHandler() {
      setState(() {
        counter++;
      });
    }

    void decrementHandler() {
      setState(() {
        if (counter == 0) return;
        counter--;
      });
    }

    /* ------------------------------ //Making row ------------------------------ */
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //Container 1
        Container(
          // width: 5,
          // height: 5,
          margin: const EdgeInsets.all(2),
          child: IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              decrementHandler();
            },
          ),
        ),

        // Container 2
        Container(
            // width: 5,
            // height: 5,
            // margin: EdgeInsets.all(2),
            child: Text('$counter')),

        // Container 3
        Container(
          // width: 5,
          // height: 5,
          // margin: EdgeInsets.all(2),
          child: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              incrementHandler();
            },
          ),
        )
      ],
    );
  }
}
