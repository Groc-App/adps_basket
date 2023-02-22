// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/category/category.dart';
import '../../providers/providers.dart';

class MainCategory extends ConsumerWidget {
  const MainCategory({super.key});

  Widget maincategoryList(
      WidgetRef ref, BuildContext context, double scHeight, double scWidth) {
    final categories = ref.watch(maincategorylistProvider);

    // print(
    //     "\n:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::");

    // print("(Inside Categories.dart list widget) Raw Categories: $categories");
    return categories.when(
      data: (list) {
        // print("(Inside Main Categoy List Widget)This is Main Category list " +
        //     '${list}');
        return maincategorylistbuilder(list, context, scHeight, scWidth);
      },
      error: (_, __) => const Center(child: Text("ERR")),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget maincategorylistbuilder(List<Category>? list, BuildContext context,
      double scHeight, double scWidth) {
    return Column(
      children: [
        Text('Categories'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getCategory(
                list != null ? list[0].Name : '',
                0.66,
                list != null ? list[0].imageurl : '',
                '/categoryScreen',
                list != null ? list[0].categoryId : '',
                context,
                scHeight,
                scWidth),
            getCategory(
                list != null ? list[1].Name : '',
                0.33,
                list != null ? list[1].imageurl : '',
                '/categoryScreen',
                list != null ? list[1].categoryId : '',
                context,
                scHeight,
                scWidth),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getCategory(
                list != null ? list[1].Name : '',
                0.33,
                list != null ? list[1].imageurl : '',
                '/categoryScreen',
                list != null ? list[1].categoryId : '',
                context,
                scHeight,
                scWidth),
            getCategory(
                list != null ? list[0].Name : '',
                0.33,
                list != null ? list[0].imageurl : '',
                '/categoryScreen',
                list != null ? list[0].categoryId : '',
                context,
                scHeight,
                scWidth),
            getCategory(
                list != null ? list[1].Name : '',
                0.33,
                list != null ? list[1].imageurl : '',
                '/categoryScreen',
                list != null ? list[1].categoryId : '',
                context,
                scHeight,
                scWidth),
          ],
        )
      ],
    );
  }

  Widget getCategory(
      String name,
      double wid_th,
      String img_url,
      String nav_url,
      String maincategoryid,
      BuildContext context,
      double scHeight,
      double scWidth) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          print("\n\nMain Category id:: $maincategoryid");
          Navigator.of(context).pushNamed('${nav_url}',
              arguments: {'maincategoryid': maincategoryid});
        },
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(244, 235, 247, 0.7)),
          height: scHeight * 0.25,
          width: scWidth * wid_th,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                decoration: BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("assets/images/MilkPng.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                alignment: Alignment(0, 1),
                child: FittedBox(
                  child: Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scSize = MediaQuery.of(context).size;
    final scWidth = scSize.width;
    final scHeight = scSize.height;

    return maincategoryList(ref, context, scHeight, scWidth);
  }
}
