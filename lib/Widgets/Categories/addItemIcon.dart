// // ignore_for_file: file_names

// import 'package:flutter/material.dart';
// import 'package:your_basket/Widgets/Categories/incrementItem.dart';

// class AddToCart extends StatefulWidget {
//   const AddToCart({super.key});

//   @override
//   State<AddToCart> createState() => _AddToCartState();
// }

// class _AddToCartState extends State<AddToCart> {
//   bool flag = true;

//   void addHandler() {
//     setState(() {
//       flag = false;
//     });
//   }

//   /* ---------------- To Show Add TO Cart Button And + - button --------------- */

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSwitcher(
//         duration: const Duration(milliseconds: 800),
//         child: flag == true
//             ? OutlinedButton(
//                 onPressed: () {
//                   addHandler();
//                 },
//                 style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(
//                         Colors.purpleAccent.withOpacity(0.3))),
//                 child: const Text('ADD'))
//             : const IncrementItem());
//   }
// }
