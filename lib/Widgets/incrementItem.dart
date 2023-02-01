import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class incrementItem extends StatefulWidget {
  @override
  State<incrementItem> createState() => _incrementItemState();
}

class _incrementItemState extends State<incrementItem> {
  // const incrementItem({super.key});
  var counter = 1;

  @override
  Widget build(BuildContext context) {
    void incrementHandler() {
      setState(() {
        counter++;
      });
    }

    ;

    void decrementHandler() {
      setState(() {
        if (counter == 0) return;
        counter--;
      });
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          // width: 5,
          // height: 5,
          margin: EdgeInsets.all(2),
          child: IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              decrementHandler();
            },
          ),
        ),
        Container(
            // width: 5,
            // height: 5,
            // margin: EdgeInsets.all(2),
            child: Text('${counter}')),
        Container(
          // width: 5,
          // height: 5,
          // margin: EdgeInsets.all(2),
          child: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              incrementHandler();
            },
          ),
        )
      ],
    );
  }
}
