// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Screens/buySubscriptionScreen.dart';
import 'package:your_basket/Widgets/Homepage/ProductItem.dart';
import 'package:your_basket/data/productsdata.dart';
import 'package:your_basket/models/product/products.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../providers/providers.dart';
import '../config.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  void incrementHandler(phonenumber, Product product) {
    if (counter == 5) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Quantity Exceeded'),
          content: const Text('Maximum Quantity limit is 5'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Ok'),
            ),
          ],
        ),
      );
    } else {
      setState(() {
        counter++;
      });

      final cartViewModel = ref.read(cartItemsProvider(phonenumber).notifier);
      cartViewModel.updateCartItem(
          phonenumber, counter.toString(), product.productId);
    }
  }

  var counter = 0;

  void decrementHandler(phonenumber, Product product) {
    if ((counter - 1) == 0) {
      final cartViewModel = ref.read(cartItemsProvider(phonenumber).notifier);
      cartViewModel
          .removeCartItems(phonenumber, product.productId)
          .whenComplete(() {
        setState(() {
          counter--;
        });
      });
    } else {
      final cartViewModel = ref.read(cartItemsProvider(phonenumber).notifier);
      cartViewModel
          .updateCartItem(
              phonenumber, (counter - 1).toString(), product.productId)
          .whenComplete(() {
        setState(() {
          counter--;
        });
      });
    }
  }

  List<Product> foundUser = [];

  Widget buildProducts(List<Product> products, authInfo, scWidth) {
    print('ye bhiiiiiiiiiiiiiiiiiii');
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ProductItem(product: products[index]);
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.58,
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
      SearchData.initialize(ref);
    });
  }

  void runFilter(String enteredKeyword) {
    print('\n filter runnungggggggggggggggg');
    List<Product> results = [];
    foundUser = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      // setState(() {});
      return;
    } else {
      results = SearchData.data
          .where((user) => user.Name.toLowerCase()
                  .trim()
                  .replaceAll(' ', '')
                  .contains(
                      enteredKeyword.toLowerCase().trim().replaceAll(' ', ''))
              //  ||
              // user.Name.toLowerCase().startsWith(enteredKeyword.toLowerCase())
              )
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      foundUser = [];
      foundUser = results;

      results = [];
    });
    // AppBuilder.of(context).rebuild();
  }

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;
    final scWidth = scSize.width;

    var authInfo = ref.watch(authCheckProvider);

    return Scaffold(
      /* ---------------------------------- BODY ---------------------------------- */
      resizeToAvoidBottomInset: true,
      body: NestedScrollView(
        body: bodyContent(scHeight, scWidth, authInfo),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.green[400],
              iconTheme: IconThemeData(
                color: Colors.white, //change your color here
              ),
              centerTitle: true,
              expandedHeight: 130,
              elevation: 5.0,
              floating: false,
              pinned: true,
              // title: innerBoxIsScrolled
              //     ? Padding(
              //         padding: const EdgeInsets.symmetric(vertical: 10.0),
              //         child: SearchBar(),
              //       )
              //     : null,
              flexibleSpace: FlexibleSpaceBar(
                  background: _buildSilverAppBarBackground(context, 100.0)),
            ),
          ];
        },
        // child: Column(
        //   children: [
        //     /* ---------------------------- Top SLider Bar ---------------------------- */
        //     Container(
        //       height: 50,
        //       margin: const EdgeInsets.all(8),
        //       padding: const EdgeInsets.all(10),
        //       decoration: BoxDecoration(
        //           boxShadow: const [
        //             BoxShadow(
        //                 color: Colors.grey, spreadRadius: 1, blurRadius: 1)
        //           ],
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(20)),
        //       child: Row(
        //         children: [
        //           const Icon(Icons.search),
        //           Container(
        //             width: 250,
        //             margin: const EdgeInsets.only(left: 10),
        //             child: TextFormField(
        //               autofocus: true,
        //               // obscuringCharacter: ,
        //               enableSuggestions: true,
        //               // onSaved: (value) {
        //               //   runFilter(value!);
        //               // },
        //               onChanged: (value) {
        //                 runFilter(value);
        //               },
        //               decoration: InputDecoration.collapsed(
        //                 hintText: 'Search',
        //               ).copyWith(isDense: true),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     foundUser.isEmpty
        //         ? SizedBox(
        //             height: scHeight * 0.8,
        //             child: const Center(child: Text("Your Items")),
        //           )
        //         : SizedBox(
        //             /* ---------------------- Building Categories Item Grid --------------------- */
        //             child: buildProducts(foundUser, authInfo, scWidth))
        //   ],
        // ),
      ),
    );
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

            height: height + 25,
            width: MediaQuery.of(context).size.width,
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
              title: TextFormField(
                autofocus: true,
                // obscuringCharacter: ,
                enableSuggestions: true,
                // onSaved: (value) {
                //   runFilter(value!);
                // },
                onChanged: (value) {
                  runFilter(value);
                },
                decoration: InputDecoration.collapsed(
                  hintText: 'Search',
                ).copyWith(isDense: true),
              ),
              actions: <Widget>[
                // IconButton(
                //   icon: Icon(Icons.search, color: Theme.of(context).primaryColor),
                //   onPressed: () {},
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bodyContent(
    scHeight,
    scWidth,
    authInfo,
  ) {
    return foundUser.isEmpty
        ? SizedBox(height: scHeight * 0.8, child: noItems())
        : SizedBox(
            /* ---------------------- Building Categories Item Grid --------------------- */
            child: buildProducts(foundUser, authInfo, scWidth));
  }

  Widget noItems() {
    return SingleChildScrollView(
      child: Column(

          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 160),
              height: Config.scHeight * 0.25,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://media.istockphoto.com/id/1158317995/vector/cute-jack-russell-terrier-paws-up-over-wall-dog-face-cartoon-vector-illustration.jpg?s=170667a&w=0&k=20&c=e_tyRS_-oSA1eowlfNVNaU__mlNig7aETgEf3pOkaBI="),
                ),
              ),
            ),
            Text(
              "No Items",
              style: TextStyle(fontStyle: FontStyle.italic),
            )
          ]),
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