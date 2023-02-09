import 'package:flutter/material.dart';
import 'package:your_basket/Widgets/Cart/Noitems.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NoItems(
      noitemtext: 'Coming Soon!!!!!!!',
    );
  }
}
