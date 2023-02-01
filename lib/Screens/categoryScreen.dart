import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:your_basket/models/product.dart';
import '../Widgets/addItemIcon.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var dummyList = List.generate(20, (index) => Catalog().products[0]);
    final sc_size = MediaQuery.of(context).size;
    final sc_width = sc_size.width;
    final sc_height = sc_size.height;

    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text("Milk And Bakery"),
            backgroundColor: Colors.redAccent),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Container(
          child: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(
                height: 100,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    width: 50,
                  ),
                  padding: EdgeInsets.all(10),
                  itemCount: dummyList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) => Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUFrU83Adg7xqXBhuJK5q012id8gx8OTd4AoJOh3ZOaKNlRg34GwYD8vqw4D_860e1YDM&usqp=CAU',
                              height: 50.0,
                              width: 50.0,
                            ),
                          ),
                          Text("Milk")
                        ],
                      )),
                ),
              ),
              SizedBox(
                height: sc_height * 0.8,
                // width: sc_width * 0.s8,
                child: GridView.builder(
                    padding: EdgeInsets.all(20),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: EdgeInsets.all(10),
                          height: 300,
                          width: 90,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 180, 47, 47),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8,
                                spreadRadius: 1,
                                color: Color.fromARGB(255, 220, 202, 202)
                                    .withOpacity(0.5),
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Image.network(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUFrU83Adg7xqXBhuJK5q012id8gx8OTd4AoJOh3ZOaKNlRg34GwYD8vqw4D_860e1YDM&usqp=CAU',
                                  fit: BoxFit.fitWidth,
                                  // height: 110,
                                  // width: 110,
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Amul Toned Milk',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('500ml',
                                        style: TextStyle(
                                          color: Colors.black,
                                          // fontWeight: FontWeight.bold),
                                        )),
                                    Container(
                                      // height: 30,
                                      // width: 50,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Row(children: [
                                        Expanded(
                                            child: Text('Rs 30',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ))),
                                        AddToCart(),
                                      ]),
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ));
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.75,
                        crossAxisCount: 2,
                        crossAxisSpacing: 40.0,
                        mainAxisSpacing: 20),
                    itemCount: dummyList.length),
              )
            ],
          )),
        ));
  }
}
