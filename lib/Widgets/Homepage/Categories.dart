// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Widgets/Errors/Dataloadingerror.dart';
import 'package:your_basket/Widgets/Sinners/mainCategorySinner.dart';

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
      error: (_, __) => const DataError(),
      loading: () => const MainCategorySinner(),
    );
  }

  Widget maincategorylistbuilder(List<Category>? list, BuildContext context,
      double scHeight, double scWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
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
                const Color.fromRGBO(247, 165, 147, 0.10)),
            getCategory(
                list != null ? list[1].Name : '',
                0.33,
                list != null ? list[1].imageurl : '',
                '/categoryScreen',
                list != null ? list[1].categoryId : '',
                context,
                scHeight,
                scWidth,
                const Color.fromRGBO(83, 177, 117, 0.10)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getCategory(
                list != null ? list[2].Name : '',
                0.33,
                list != null ? list[2].imageurl : '',
                '/categoryScreen',
                list != null ? list[2].categoryId : '',
                context,
                scHeight,
                scWidth,
                const Color.fromRGBO(211, 176, 224, 0.25)),
            getCategory(
                list != null ? list[3].Name : '',
                0.33,
                list != null ? list[3].imageurl : '',
                '/categoryScreen',
                list != null ? list[3].categoryId : '',
                context,
                scHeight,
                scWidth,
                const Color.fromRGBO(248, 164, 76, 0.1)),
            getCategory(
              list != null ? list[4].Name : '',
              0.33,
              list != null ? list[4].imageurl : '',
              '/categoryScreen',
              list != null ? list[4].categoryId : '',
              context,
              scHeight,
              scWidth,
              const Color.fromRGBO(183, 223, 245, 0.25),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getCategory(
                list != null ? list[5].Name : '',
                0.33,
                list != null ? list[5].imageurl : '',
                '/categoryScreen',
                list != null ? list[5].categoryId : '',
                context,
                scHeight,
                scWidth,
                const Color.fromRGBO(211, 176, 224, 0.25)),
            getCategory(
                list != null ? list[6].Name : '',
                0.33,
                list != null ? list[6].imageurl : '',
                '/categoryScreen',
                list != null ? list[6].categoryId : '',
                context,
                scHeight,
                scWidth,
                const Color.fromRGBO(248, 164, 76, 0.1)),
            getCategory(
              list != null ? list[7].Name : '',
              0.33,
              list != null ? list[7].imageurl : '',
              '/categoryScreen',
              list != null ? list[7].categoryId : '',
              context,
              scHeight,
              scWidth,
              const Color.fromRGBO(183, 223, 245, 0.25),
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
          Navigator.of(context).pushNamed('${nav_url}', arguments: {
            'maincategoryid': maincategoryid,
            'name': name,
            'imageUrl': img_url
          });
        },
        child: Container(
          height: scHeight * 0.25,
          width: (scWidth * wid_th) - 6,
          margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                decoration: BoxDecoration(
                    color: clr, borderRadius: BorderRadius.circular(8)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                          height: scHeight * 0.25 * 0.7,
                          child: CachedNetworkImage(
                            fadeInDuration: const Duration(milliseconds: 50),
                            imageUrl: img_url,
                            fit: BoxFit.contain,
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ))
                    ]),
              )),
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
