// ignore_for_file: file_names, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Widgets/Homepage/ProductItem.dart';
import 'package:your_basket/Widgets/Homepage/Quote.dart';

import '../Widgets/Homepage/Carousel.dart';
import '../Widgets/Homepage/BottomNavBar.dart';
import '../Widgets/Homepage/Categories.dart';
import '../Widgets/Homepage/MostSelling.dart';

import 'package:flutter/material.dart';

import '../providers/providers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.deepPurple,
        // iconTheme: IconThemeData(),
        leading: Icon(
          Icons.shopping_cart_outlined,
          color: Color.fromRGBO(83, 177, 117, 1),
        ),
        title: Text('SpeedGrocery'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/searchScreen');
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Quote(),
            Carousel(),
            MainCategory(),
            MostSelling(),
          ],
        ),
      ),
      bottomNavigationBar: const BotmNavBar(),
    );
  }
}
