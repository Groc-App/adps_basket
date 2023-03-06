// // ignore: unused_import
// // ignore_for_file: file_names, unused_local_variable

// import 'package:flutter/material.dart';

// class IncrementItem extends StatefulWidget {
//   const IncrementItem({super.key});

//   @override
//   State<IncrementItem> createState() => _incrementItemState();
// }

// // ignore: camel_case_types
// class _incrementItemState extends State<IncrementItem> {
//   // const incrementItem({super.key});
//   var counter = 1;

//   @override
//   Widget build(BuildContext context) {
//     final scSize = MediaQuery.of(context).size;
//     final scWidth = scSize.width;
//     final scHeight = scSize.height;
//     /* ------------------- To INcrement and Decrement Counter ------------------- */
//     void incrementHandler() {
//       setState(() {
//         counter++;
//       });
//     }

//     void decrementHandler() {
//       setState(() {
//         if (counter == 1) return;
//         counter--;
//       });
//     }

//     /* ------------------------------ //Making row ------------------------------ */
//     return Container(
//       // margin: EdgeInsets.only(bottom: sc_height * 0.1),
//       margin: const EdgeInsets.only(bottom: 2),
//       width: scWidth * 0.28 * 0.35,
//       height: scWidth * 0.28 * 0.15,

//       color: const Color.fromARGB(255, 130, 96, 177).withOpacity(0.3),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           GestureDetector(
//             onTap: decrementHandler,
//             child: Icon(Icons.remove, size: scWidth * 0.28 * 0.15 * 0.7),
//           ),
//           Text('$counter'),
//           GestureDetector(
//             onTap: incrementHandler,
//             child: Icon(Icons.add, size: scWidth * 0.28 * 0.15 * 0.7),
//           )
//         ],
//       ),
//     );
//   }
// }
