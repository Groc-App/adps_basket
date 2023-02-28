// import 'package:flutter/material.dart';
// ignore_for_file: file_names

import 'dart:math';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:your_basket/Screens/ProfileScreen.dart';
import 'package:your_basket/Screens/cartScreen.dart';
import 'package:your_basket/Screens/homeScreen.dart';

class BotmNavBar extends StatefulWidget {
  const BotmNavBar({super.key});

  @override
  State<BotmNavBar> createState() => _BotmNavBarState();
}

class _BotmNavBarState extends State<BotmNavBar> {
  @override
  Widget build(BuildContext context) {
    int _selectedindex = 0;

    var routes = [
      '/homepage',
      '/cartScreen',
      '/offerScreen',
      '/subscriptionScreen',
      '/profileScreen',
    ];

    void _setIndex(int index) {
      setState(() {
        _selectedindex = index;
      });
      print(_selectedindex);
      if (index == 0) {
        return null;
      } else {
        Navigator.of(context).pushNamed('${routes[index]}');
      }
    }

    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;

    return BottomNavigationBar(
      currentIndex: _selectedindex,
      onTap: _setIndex,
      type: BottomNavigationBarType.fixed,
      // backgroundColor: Colors.deepPurple,
      // selectedItemColor: Colors.white,
      // unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined), label: 'Cart'),
        BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_outlined), label: 'Offer'),
        BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_outlined), label: 'Subscrip'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined), label: 'Profile'),
      ],
    );
  }
}
