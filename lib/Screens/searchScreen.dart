import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:your_basket/Widgets/Categories/searchBar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;
    return Scaffold(
      /* --------------------------------- APP BAR -------------------------------- */
      appBar: AppBar(
          centerTitle: true,
          // ignore: prefer_const_constructors
          title: Text(
            "Milk And Bakery",
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
          ),
          backgroundColor: const Color.fromARGB(255, 237, 230, 230)),
      backgroundColor: const Color.fromARGB(255, 237, 230, 230),

      /* ---------------------------------- BODY ---------------------------------- */

      body: Column(
        children: [
          SearchBar(),
          Container(
            height: scHeight * 0.8,
            child: Center(child: Text("Your Items")),
          )
        ],
      ),
    );
  }
}
