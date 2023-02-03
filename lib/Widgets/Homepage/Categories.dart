// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scWidth = scSize.width;
    final scHeight = scSize.height;

    Widget getCategory(wid_th, img_url, nav_url) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('${nav_url}');
          },
          child: Container(
            height: scHeight * 0.25,
            width: scWidth * wid_th,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  'https://www.dairyfoods.com/ext/resources/2022/10/27/Dairy-Products.jpeg?1666879344',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getCategory(0.66, 'img_url', '/categoryScreen'),
            getCategory(0.33, 'img_url', '/categoryScreen'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getCategory(0.33, 'img_url', '/categoryScreen'),
            getCategory(0.33, 'img_url', '/categoryScreen'),
            getCategory(0.33, 'img_url', '/categoryScreen'),
          ],
        )
      ],
    );
  }
}
