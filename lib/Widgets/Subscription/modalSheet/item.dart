import 'package:flutter/material.dart';
import 'package:your_basket/config.dart';
import 'package:intl/intl.dart';

import '../../../models/subscription/subscription.dart';

class ModalItem extends StatelessWidget {
  String name;
  String imageURL;
  ModalItem({required this.name, required this.imageURL, super.key});

  var scSize = Config.scSize;
  var scHeight = Config.scHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: Config.scHeight * 0.8 * 0.2,
      // width: double.infinit,q
      decoration: BoxDecoration(border: Border.all()),
      child: Row(
        children: [
          Image.network(
            imageURL,
            height: 100,
            width: 100,
            fit: BoxFit.contain,
          ),
          Expanded(
            // fit: BoxFit.scaleDown,
            child: Text(
              name,
              maxLines: 2,
              softWrap: true,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
