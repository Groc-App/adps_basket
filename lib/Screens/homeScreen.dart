// ignore_for_file: file_names, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:your_basket/Screens/buySubscriptionScreen.dart';
import 'package:your_basket/Widgets/Homepage/Quote.dart';
import 'package:your_basket/config.dart';

import '../Widgets/Categories/searchBar.dart';
import '../Widgets/Homepage/Carousel.dart';
import '../Widgets/Homepage/BottomNavBar.dart';
import '../Widgets/Homepage/Categories.dart';
import '../Widgets/Homepage/MostSelling.dart';

import 'package:flutter/material.dart';

const kExpandedHeight = 120.0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        body: bodyContent(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.green[400],
              centerTitle: true,
              expandedHeight: 130,
              elevation: 5.0,
              floating: false,
              pinned: true,
              title: innerBoxIsScrolled
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: SearchBar(),
                    )
                  : null,
              flexibleSpace: FlexibleSpaceBar(
                  background: _buildSilverAppBarBackground(context, 100.0)),
            ),
          ];
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/offerScreen');
        },
        backgroundColor: Colors.green[400],
        foregroundColor: Colors.white,
        child: CachedNetworkImage(
          fadeInDuration: const Duration(milliseconds: 50),
          imageUrl:
              'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Icons%2Fbottomnavbar%2Foffer-icon-2.png?alt=media&token=ebadf132-5585-4527-8511-c7790ff1ab88',
          height: 27,
        ),
      ),
      bottomNavigationBar: const BotmNavBar(),
    );
  }
}

_buildSilverAppBarBackground(context, height) {
  return Container(
    decoration: BoxDecoration(color: Colors.white),
    height: 25,
    child: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.green[400],
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
          ),
          height: height + 25,
          width: MediaQuery.of(context).size.width,
          child: const Center(
            child: Text(
              "Basko",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        ),
        Positioned(
          top: 100.0,
          left: 20.0,
          right: 20.0,
          child: AppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: Colors.white,
            leading: Icon(
              Icons.search,
              color: Theme.of(context).primaryColor,
            ),
            primary: false,
            title: TextField(
                onTap: () {
                  Navigator.of(context).pushNamed('/searchScreen');
                },
                decoration: InputDecoration(
                    hintText: "search,  order,  repeat",
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey))),
          ),
        ),
      ],
    ),
  );
}

Widget bodyContent() {
  return ListView(
    padding: EdgeInsets.only(top: 0),
    // ignore: prefer_const_literals_to_create_immutables
    children: [
      Quote(),
      Carousel(),
      MainCategory(),
      MostSelling(),
    ],
  );
}
