// ignore_for_file: file_names, prefer_const_constructors

import '../Widgets/Homepage/Carousel.dart';
import '../Widgets/Homepage/BottomNavBar.dart';
import '../Widgets/Homepage/Categories.dart';
import '../Widgets/Homepage/MostSelling.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // Carousel(),
            Category(),
            MostSelling(),
          ],
        ),
      ),
      bottomNavigationBar: const BotmNavBar(),
    );
  }
}
