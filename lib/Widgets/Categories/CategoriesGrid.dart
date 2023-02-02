// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'addItemIcon.dart';

class CatergoriesGrid extends StatelessWidget {
  const CatergoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scWidth = scSize.width;

    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 255, 255, 255),
            blurRadius: 1,
            spreadRadius: 1,
          )
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('/productItemPage');
        },
        child: Card(
          color: Color.fromARGB(255, 255, 255, 255),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: scWidth * 0.28,
                      child: Image.network(
                        'https://m.media-amazon.com/images/I/812816L+HkL._SL1500_.jpg',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),

                  // ignore: avoid_unnecessary_containers
                  Container(
                    // margin: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Amul Toned Milk',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('500 ml'),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "20 RS",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          AddToCart()
                        ]),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}



// child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [Text("20 RS"), AddToCart()]),



// Container(
//       /* -------------------------- //Grid Item Container ------------------------- */
//       margin: const EdgeInsets.all(10),
//       height: 300,
//       width: 90,
//       decoration: BoxDecoration(
//         color: const Color.fromARGB(255, 180, 47, 47),
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             blurRadius: 8,
//             spreadRadius: 1,
//             color: const Color.fromARGB(255, 220, 202, 202).withOpacity(0.5),
//           )
//         ],
//       ),
//       /* -------------------------- ItemBox Column Start -------------------------- */
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           /* ------------------------------ Column Image ------------------------------ */
//           Expanded(
//             flex: 2,
//             child: Image.network(
//               'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUFrU83Adg7xqXBhuJK5q012id8gx8OTd4AoJOh3ZOaKNlRg34GwYD8vqw4D_860e1YDM&usqp=CAU',
//               fit: BoxFit.fitWidth,
//               // height: 110,
//               // width: 110,
//             ),
//           ),

//           /* ------------------------------ Column Footer ----------------------------- */
//           Expanded(
//               child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

//             /* ----------------------------- Title And Price ---------------------------- */
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Amul Toned Milk',
//                   style: TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                 ),
//                 const Text(
//                   '500ml',
//                   style: TextStyle(
//                     color: Colors.black,
//                     // fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Container(
//                   // height: 30,
//                   // width: 50,
//                   padding: const EdgeInsets.symmetric(vertical: 10),

//                   /* ----------------------- //Row For Price and Button ----------------------- */
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [Text("20 RS"), AddToCart()]),
//                 )
//               ],
//             ),
//           ))
//         ],
//       ),
//     );