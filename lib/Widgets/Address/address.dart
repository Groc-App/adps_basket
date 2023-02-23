import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:your_basket/models/address/address.dart';
// import 'pa';
import '../../models/address/address.dart' as Addresmodel;

class Address extends StatelessWidget {
  // const Address({super.key});
  Addresmodel.Address data;

  Address({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scWidth = scSize.width;

    return Row(
      children: [
        Container(
          // width: scWidth * 0.16,
          child: Icon(Icons.home),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Home - ${data.Recipients_Name}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                  "${data.Flat_FLoor_Tower} ${data.Street_Society} ${data.City} ${data.Pincode}")
            ],
          ),
        ),
        Spacer(),
        Container(child: Icon(Icons.edit)),
        SizedBox(
          width: 10,
        ),
        Container(
          child: Icon(Icons.delete),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
