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

    return categories.when(
      data: (list) {
        return maincategorylistbuilder(list, context, scHeight, scWidth);
      },
      error: (_, __) => const Center(child: Text("ERR")),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget maincategorylistbuilder(List<Category>? list, BuildContext context,
      double scHeight, double scWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Categories',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
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
                scWidth,
                Color.fromRGBO(247, 165, 147, 0.10)),
            getCategory(
                list != null ? list[1].Name : '',
                0.33,
                list != null ? list[1].imageurl : '',
                '/categoryScreen',
                list != null ? list[1].categoryId : '',
                context,
                scHeight,
                scWidth,
                Color.fromRGBO(83, 177, 117, 0.10)),
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
                scWidth,
                Color.fromRGBO(211, 176, 224, 0.25)),
            getCategory(
                list != null ? list[0].Name : '',
                0.33,
                list != null ? list[0].imageurl : '',
                '/categoryScreen',
                list != null ? list[0].categoryId : '',
                context,
                scHeight,
                scWidth,
                Color.fromRGBO(248, 164, 76, 0.1)),
            getCategory(
              list != null ? list[1].Name : '',
              0.33,
              list != null ? list[1].imageurl : '',
              '/categoryScreen',
              list != null ? list[1].categoryId : '',
              context,
              scHeight,
              scWidth,
              Color.fromRGBO(183, 223, 245, 0.25),
            )
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
    double scWidth,
    Color clr,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          print("\n\nMain Category id:: $maincategoryid");
          Navigator.of(context).pushNamed('${nav_url}',
              arguments: {'maincategoryid': maincategoryid});
        },
        child: Container(
          // decoration: BoxDecoration(color: Color.fromRGBO(244, 235, 247, 0.7)),
          height: scHeight * 0.25,
          width: scWidth * wid_th,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 3, vertical: 4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  // boxShadow: [BoxShadow(blurRadius: 1)],
                  /* ---------------------------------- color --------------------------------- */
                  color: clr,
                  borderRadius: BorderRadius.circular(8),
                  // border: Border.all(width: 2, color: clr),
                  // ignore: prefer_const_constructors
                  image: DecorationImage(
                    image: const AssetImage(
                        "assets/images/Dairy-Products-Png.png"),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                alignment: const Alignment(0, -0.9),
                child: FittedBox(
                  child: Text(
                    "$name",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: maincategoryList(ref, context, scHeight, scWidth - 16),
    );
  }
}
