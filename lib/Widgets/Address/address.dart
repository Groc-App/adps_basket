import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Address extends StatelessWidget {
  const Address({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [Icon(Icons.home), Text("0.0 km")],
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Home",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text("House No-134 Room No -g2 ,Unicosmos school road")
          ],
        ),
        Spacer(),
        Icon(Icons.edit)
      ],
    );
  }
}
