// ignore_for_file: file_names, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:your_basket/Widgets/Homepage/Quote.dart';

import '../Widgets/Categories/searchBar.dart';
import '../Widgets/Homepage/Carousel.dart';
import '../Widgets/Homepage/BottomNavBar.dart';
import '../Widgets/Homepage/Categories.dart';
import '../Widgets/Homepage/MostSelling.dart';

import 'package:flutter/material.dart';

const kExpandedHeight = 120.0;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // const HomeScreen({super.key});
  // _appBar(height, context) => PreferredSize(
  //       preferredSize: Size(MediaQuery.of(context).size.width, height + 80),
  //       child: Stack(
  //         children: <Widget>[
  //           Container(
  //             // Background
  //             child: Center(
  //               child: Text(
  //                 "Basko",
  //                 style: TextStyle(
  //                     fontSize: 25.0,
  //                     fontWeight: FontWeight.w600,
  //                     color: Colors.white),
  //               ),
  //             ),
  //             color: const Color.fromRGBO(83, 177, 117, 1),
  //             height: height + 75,
  //             width: MediaQuery.of(context).size.width,
  //           ),

  //           Container(), // Required some widget in between to float AppBar

  //           Positioned(
  //             // To take AppBar Size only
  //             top: 100.0,
  //             left: 20.0,
  //             right: 20.0,
  //             child: AppBar(
  //               backgroundColor: Colors.white,
  //               leading: Icon(
  //                 Icons.menu,
  //                 color: Theme.of(context).primaryColor,
  //               ),
  //               primary: false,
  //               title: TextField(
  //                   decoration: InputDecoration(
  //                       hintText: "Search",
  //                       border: InputBorder.none,
  //                       hintStyle: TextStyle(color: Colors.grey))),
  //               actions: <Widget>[
  //                 IconButton(
  //                   icon: Icon(Icons.search,
  //                       color: Theme.of(context).primaryColor),
  //                   onPressed: () {},
  //                 ),
  //               ],
  //             ),
  //           )
  //         ],
  //       ),
  //     );

  @override
  Widget build(BuildContext context) {
    // final scSize = MediaQuery.of(context).size;
    // final scHeight = scSize.height;
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
    decoration: BoxDecoration(
        // border: Border.all(),
        color: Colors.white),
    // color: Colors.white,
    height: 25,
    child: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.green[400],
            // color: Colors.white,bo
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
          ),

          height: height + 25,
          width: MediaQuery.of(context).size.width,
          // Background
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

        // Container(), // Required some widget in between to float AppBar
//
        Positioned(
          // To take AppBar Size only
          top: 100.0,
          left: 20.0,
          right: 20.0,
          child: AppBar(
            // titleSpacing: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12

                  // bottom: Radius.circular(8),
                  ),
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
