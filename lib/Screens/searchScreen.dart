// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Widgets/Homepage/ProductItem.dart';
import 'package:your_basket/data/productsdata.dart';
import 'package:your_basket/models/product/products.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  List<Product> foundUser = [];

  Widget buildProducts(List<Product> products) {
    print('yeasssssss inside search');
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ProductItem(
            product: products[index],
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.6,
          crossAxisCount: 2,
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
        ),
        itemCount: products.length);
  }

  @override
  void initState() {
    // TODO: implement initState
    // foundUser = data;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
// your code goes here
      SearchData.initialize(ref);
    });
  }

  void runFilter(String enteredKeyword) {
    List<Product> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      // results = _allUsers;
    } else {
      results = SearchData.data
          .where((user) =>
              user.Name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      foundUser = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;
    return Scaffold(
      /* --------------------------------- APP BAR -------------------------------- */
      // appBar: AppBar(
      //     centerTitle: true,
      //     // ignore: prefer_const_constructors
      //     title: Text(
      //       "Milk And Bakery",
      //       style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
      //     ),
      //     backgroundColor: const Color.fromARGB(255, 237, 230, 230)),

      backgroundColor: const Color.fromARGB(255, 237, 230, 230),

      /* ---------------------------------- BODY ---------------------------------- */

      body: SafeArea(
        child: SingleChildScrollView(
          // padding: EdgeInsets.only(top: MediaQuery.of(context).size.),
          child: Column(
            children: [
              /* ---------------------------- Top SLider Bar ---------------------------- */
              Container(
                height: 50,
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey, spreadRadius: 1, blurRadius: 1)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    const Icon(Icons.search),
                    Container(
                      width: 250,
                      margin: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                        autofocus: true,
                        onChanged: (value) {
                          runFilter(value);
                        },
                        decoration: InputDecoration.collapsed(
                          hintText: 'Search',
                        ).copyWith(isDense: true),
                      ),
                    ),
                  ],
                ),
              ),
              foundUser.isEmpty
                  ? SizedBox(
                      height: scHeight * 0.8,
                      child: const Center(child: Text("Your Items")),
                    )
                  : SizedBox(
                      /* ---------------------- Building Categories Item Grid --------------------- */
                      child: buildProducts(foundUser))
            ],
          ),
        ),
      ),
    );
  }
}


//  /* --------------------------- Screen Intilization -------------------------- */
//     final scSize = MediaQuery.of(context).size;
//     final scHeight = scSize.height;

//     /* -------------------------------- Scaffold -------------------------------- */
//     return Scaffold(

//         /* --------------------------------- appBar --------------------------------- */
//         appBar: AppBar(
//             centerTitle: true,
//             // ignore: prefer_const_constructors
//             title: Text(
//               "Milk And Bakery",
//               style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
//             ),
//             backgroundColor: const Color.fromARGB(255, 237, 230, 230)),
//         backgroundColor: const Color.fromARGB(255, 237, 230, 230),

//         /* ---------------------------------- body ---------------------------------- */
//         body: SingleChildScrollView(
//             child: Column(
//           children: [
//             /* ---------------------------- Top SLider Bar ---------------------------- */
//             Container(
//             height: 50,
//             margin: const EdgeInsets.all(8),
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(boxShadow: const [
//               BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 1)
//             ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
//             child: Row(
//               children: [
//                 const Icon(Icons.search),
//                 Container(
//                   width: 250,
//                   margin: const EdgeInsets.only(left: 10),
//                   child: TextFormField(
//                     onChanged: (value) {
//                       runFilter(value);
//                     },
//                     decoration: const InputDecoration(
//                       hintText: "Search here......",
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           foundUser.length == 0
//               ? SizedBox(
//                   height: scHeight * 0.8,
//                   child: const Center(child: Text("Your Items")),
//                 )
//               :  SizedBox(
//                 // height: scHeight * 0.8,
//                 // width: sc_width * 0.s8,
//                 // height: double.maxFinite,

//                 /* ---------------------- Building Categories Item Grid --------------------- */
//                 child: productList(foundUser))
//         ],
//       ),
//           ],
//         )));