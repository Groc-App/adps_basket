// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:your_basket/Widgets/Categories/addItemIcon.dart';

class ProductItemScreen extends StatelessWidget {
  const ProductItemScreen({super.key});

  // const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 237, 230, 230),
          title: const Text("Good"),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
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
                height: MediaQuery.of(context).size.height * 0.7,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all((15)),
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 2, spreadRadius: 2)
                  ],
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 15,
                        ),
                        // ignore: prefer_const_literals_to_create_immutables
                        child: Row(children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "BREAD",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("12pcs")
                            ],
                          ),
                          const Spacer(),
                          const Icon(Icons.share),
                        ]),
                      ),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            "Rs 20",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
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
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 9),
                              child: Text(
                                "Product Details",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            const Text(
                              "Description",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: const Text(
                                "Amul Sandwich bread is made out of pure and wholesome ingredients. The soft white bread is perfect for making sandwiches, bread pakoras, butter toast etc. Amul Sandwich bread is made out of pure and wholesome ingredients. The soft white bread is perfect for making sandwiches, bread pakoras, butter toast etc.",
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                children: const [
                                  Text(
                                    "Read more details",
                                    style: TextStyle(color: Colors.purple),
                                  ),
                                  Icon(Icons.arrow_drop_down)
                                ],
                              ),
                            )
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
          )),
        ),
        backgroundColor: const Color.fromARGB(255, 235, 227, 227),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              // textColor: Colors.white,
              child: const Text('View Cart'),
            ),
          ),
        ));
  }
}
