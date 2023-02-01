// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CategorySliderItems extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final categoryName;
  // ignore: prefer_typing_uninitialized_variables
  final catergoryURL;

  const CategorySliderItems(this.categoryName, this.catergoryURL, {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            catergoryURL,
            height: 50.0,
            width: 50.0,
          ),
        ),
        Text(categoryName)
      ],
    );
  }
}
