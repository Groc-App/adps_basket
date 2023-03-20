// ignore_for_file: file_names, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
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
      backgroundColor: Color.fromRGBO(243, 243, 243, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(243, 243, 243, 1),
        elevation: 0,
        leadingWidth: 50,
        leading: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: CachedNetworkImage(
            imageUrl:
                'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Logo%2Flogo.png?alt=media&token=bde72ad0-a31b-405c-911c-6a45e258b6db',
            // progressIndicatorBuilder: (context, url, downloadProgress) =>
            //     CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        title: Text('Basko'),
        // title:
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/offerScreen');
        },
        backgroundColor: Colors.green[400],
        foregroundColor: Colors.white,
        child: CachedNetworkImage(
          imageUrl:
              'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Icons%2Fbottomnavbar%2Foffer-icon-2.png?alt=media&token=ebadf132-5585-4527-8511-c7790ff1ab88',
          height: 27,
        ),
      ),
      bottomNavigationBar: const BotmNavBar(),
    );
  }
}
