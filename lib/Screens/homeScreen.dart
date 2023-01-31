import 'dart:math';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sc_size = MediaQuery.of(context).size;
    final sc_width = sc_size.width;
    final sc_height = sc_size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 212, 127, 227),
      ),
      body: Container(
        child: Center(child: Text('This is home Page')),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(
            FontAwesomeIcons.houseChimney,
            size: 18,
            // color: Colors.purple,
          ),
          Icon(
            FontAwesomeIcons.cartShopping,
            size: 18,
            // color: Colors.purple,
          ),
          Icon(
            FontAwesomeIcons.code,
            size: 18,
            // color: Colors.purple,
          ),
          Icon(
            FontAwesomeIcons.user,
            size: 18,
            // color: Colors.purple,
            fill: 1.0,
          ),
        ],
        animationDuration: Duration(milliseconds: 200),
        height: max(sc_height * 0.08, 50),
        backgroundColor: Colors.white,
        color: Color.fromARGB(255, 212, 127, 227),
        buttonBackgroundColor: Colors.white,
      ),
    );
  }
}
