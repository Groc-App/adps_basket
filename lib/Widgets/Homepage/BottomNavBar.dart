// import 'package:flutter/material.dart';
import 'dart:math';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class BotmNavBar extends StatelessWidget {
  const BotmNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;

    return CurvedNavigationBar(
      // ignore: prefer_const_literals_to_create_immutables
      items: [
        const Icon(
          FontAwesomeIcons.houseChimney,
          size: 18,
          // color: Colors.purple,
        ),
        const Icon(
          FontAwesomeIcons.cartShopping,
          size: 18,
          // color: Colors.purple,
        ),
        const Icon(
          FontAwesomeIcons.code,
          size: 18,
          // color: Colors.purple,
        ),
        const Icon(
          FontAwesomeIcons.user,
          size: 18,
          // color: Colors.purple,
          // fill: 1.0,
        ),
      ],
      animationDuration: const Duration(milliseconds: 200),
      height: max(scHeight * 0.08, 50),
      backgroundColor: Colors.white,
      color: const Color.fromARGB(255, 212, 127, 227),
      buttonBackgroundColor: Colors.white,
    );
  }
}
