// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Widgets/Homepage/ProductItem.dart';
import 'package:your_basket/data/productsdata.dart';
import 'package:your_basket/models/product/products.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../providers/providers.dart';

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

      final cartViewModel = ref.read(cartItemsProvider.notifier);
      cartViewModel.updateCartItem(
          phonenumber, counter.toString(), product.productId);
    }
  }

  var counter = 0;

  void decrementHandler(phonenumber, Product product) {
    if ((counter - 1) == 0) {
      final cartViewModel = ref.read(cartItemsProvider.notifier);
      cartViewModel
          .removeCartItems(phonenumber, product.productId)
          .whenComplete(() {
        setState(() {
          counter--;
        });
      });
    } else {
      final cartViewModel = ref.read(cartItemsProvider.notifier);
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
                      child: buildProducts(foundUser, authInfo, scWidth))
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