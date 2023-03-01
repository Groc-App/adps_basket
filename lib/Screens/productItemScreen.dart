// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Widgets/Categories/addItemIcon.dart';
import 'package:readmore/readmore.dart';
import 'package:your_basket/models/product/productdetail.dart';
import 'package:your_basket/providers/providers.dart';

class ProductItemScreen extends ConsumerWidget {
  // ProductItemScreen({super.key});
  late String productid;

  late ProductItem product;

  // ProductItemScreen({required this.productid});

  Widget productdetail(WidgetRef ref, BuildContext context) {
    var productIdMap = (ModalRoute.of(context)?.settings.arguments ??
        <String, String>{}) as Map;
    productid = productIdMap['productId'];
    print("\ncscscsv:: $productid");

    final prdct = ref.watch(productByidProvider(productid));
    print(prdct);
    return prdct.when(
      data: (dt) {
        // return buildCategory(list);
        // print("this is Productt||||||||||||||");
        // print(dt);
        product = dt!;
        return buildProduct(dt, context);
      },
      error: (_, __) => const Center(child: Text("ERR")),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget buildProduct(ProductItem? Product, BuildContext context) {
    var productIdMap = (ModalRoute.of(context)?.settings.arguments ??
        <String, String>{}) as Map;
    productid = productIdMap['productId'];
    print("\ncscscsv:: $productid");
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(
            (15),
          ),
          height: MediaQuery.of(context).size.height * 0.3,
          width: double.infinity,
          alignment: Alignment.topLeft,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://bonn.in/wp-content/uploads/2019/10/brown-dummy-with-sandwich-only.png'))),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.53,
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all((15)),
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 2)
            ],
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 15,
              ),
              // ignore: prefer_const_literals_to_create_immutables
              child: Row(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Product!.Name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(Product.Quantity)
                  ],
                ),
                const Spacer(),
                const Icon(Icons.share),
              ]),
            ),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  "Rs ${Product.Price}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const Spacer(),
                const AddToCart()
              ],
            ),
            const Divider(
              // height: 10,
              thickness: 0.8,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 9),
                    child: Text(
                      "Product Details",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  const Text(
                    "Description",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  ReadMoreText(
                    trimLength: 100,
                    trimLines: 2,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Length,
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    '${Product.Description}',
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 5),
                  //   child: Row(
                  //     children: const [
                  //       Text(
                  //         "Read more details",
                  //         style: TextStyle(color: Colors.purple),
                  //       ),
                  //       Icon(Icons.arrow_drop_down)
                  //     ],
                  //   ),
                  // )
                ],
              ),
            )
            // const Padding(
            //   padding: EdgeInsets.symmetric(vertical: 20),
            //   child: ,
            // )
          ]),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 237, 230, 230),
          title: const Text("Good"),
        ),
        body: SafeArea(
          child: SingleChildScrollView(child: productdetail(ref, context)),
        ),
        backgroundColor: const Color.fromARGB(255, 235, 227, 227),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/cartScreen');
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  // textColor: Colors.white,
                  child: const Text('View Cart'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/buySubscriptionScreen',
                        arguments: {
                          'name': product.Name,
                          'image': product.ImageUrl
                        });
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  // textColor: Colors.white,
                  child: const Text('Subscribe'),
                ),
              ],
            ),
          ),
        ));
  }
}
