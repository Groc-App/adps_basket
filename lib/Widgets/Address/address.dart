import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Address extends StatelessWidget {
  const Address({super.key});

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scWidth = scSize.width;

    return Row(
      children: [
        Container(
          // width: scWidth * 0.16,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [Icon(Icons.home), Text("0.0 km")],
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Home",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text("House No-134 Room No -g2 ,Unicosmos school road")
            ],
          ),
        ),
        Spacer(),
        Container(child: Icon(Icons.edit)),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
