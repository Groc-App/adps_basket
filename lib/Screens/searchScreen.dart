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

  Widget addTile(scWidth, String number, Product product) {
    if (number != '') {
      final CartItemModel = ref.watch(cartItemsProvider);

      if (CartItemModel.isLoading) {
        // return CircularProgressIndicator();
        return SpinKitThreeInOut(
          size: 25,
          color: Theme.of(context).primaryColor,
        );
      }

      // if (CartItemModel.cartModel == null) {
      //   return const LinearProgressIndicator();
      // }

      var searchdata = CartItemModel.cartModel!.products;

      bool flag = false;
      for (int i = 0; i < searchdata.length; i++) {
        var data = searchdata[i];
        if (product.productId == data.Item.productId) {
          setState(() {
            counter = data.ItemCount;
          });
          flag = true;
          break;
        }
      }
      if (flag == false) {
        setState(() {
          counter = 0;
        });
      }
    }
    return buildAddTile(scWidth, number, product);
  }

  Widget buildAddTile(scWidth, String? number, Product product) {
    return counter != 0
        ? Container(
            width: scWidth * 0.48 * 0.36,
            height: scWidth * 0.48 * 0.20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child:
                        Icon(Icons.remove, size: scWidth * 0.48 * 0.36 * 0.2),
                    onTap: () => decrementHandler(number, product),
                  ),
                ),
                Text('$counter'),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child: Icon(Icons.add, size: scWidth * 0.48 * 0.36 * 0.2),
                    onTap: () => incrementHandler(number, product),
                  ),
                ),
              ],
            ),
          )
        : Container(
            width: scWidth * 0.48 * 0.38,
            child: FittedBox(
              child: OutlinedButton(
                  onPressed: () {
                    if (number == '') {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Login First'),
                          content: const Text('Login to Continue'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/loginScreen'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    } else {
                      setState(() {
                        counter++;
                      });
                      final cartViewModel =
                          ref.read(cartItemsProvider.notifier);
                      cartViewModel.addCartItems(number, product.productId);
                    }
                  },
                  child: const Text('ADD')),
            ),
          );
  }

  Widget buildProducts(List<Product> products, authInfo, scWidth) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/productItemPage', arguments: {
                'product': products[index],
                'counter': counter,
              });
            },
            child: Card(
              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              // color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        flex: 3,
                        child: CachedNetworkImage(
                          imageUrl: products[index].ImageUrl[0],
                          fit: BoxFit.cover,
                          // progressIndicatorBuilder:
                          //     (context, url, downloadProgress) =>
                          //         CircularProgressIndicator(
                          //             value: downloadProgress.progress),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding:
                              const EdgeInsets.only(top: 7, left: 5, right: 5),
                          // fit: BoxFit.scaleDown,
                          // decoration: BoxDecoration(border: Border.all()),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                products[index].Name,
                                softWrap: true,
                                maxLines: 2,
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Text(
                                  products[index].Quantity,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                width: scWidth * 0.48 * 0.28,
                                child: Container(
                                    // fit: BoxFit.scaleDown,
                                    child: Text(
                                  '\u{20B9}${products[index].Price.toInt()}',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ))),
                            authInfo == null
                                ? addTile(scWidth, '', products[index])
                                : addTile(scWidth, authInfo.phoneNumber!,
                                    products[index]),
                            // addTile(scWidth, '+917982733943'),
                          ],
                        ),
                      )
                    ]),
              ),
            ),
          );
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
// your code goes here
      SearchData.initialize(ref);
    });
  }

  void runFilter(String enteredKeyword) {
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
                  .contains(enteredKeyword.toLowerCase())
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

    var foundUserData = foundUser;

    return Scaffold(
      /* --------------------------------- APP BAR -------------------------------- */
      // appBar: AppBar(
      //     centerTitle: true,
      //     // ignore: prefer_const_constructors
      //     title: Text(
      //       "Milk And Bakery",
      //       style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
      //     ),)

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
                        onSaved: (value) {
                          runFilter(value!);
                        },
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
                      child: buildProducts(foundUserData, authInfo, scWidth))
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