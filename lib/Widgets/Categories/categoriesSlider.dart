// ignore_for_file: file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// late Map<String, String> map;
final categoryProvider = StateProvider.family<Map<String, String>, String>(
    (ref, String id) => {"mainCategoryId": id, "subCategoryId": "null"});

class CategorySliderItems extends ConsumerWidget {
  // ignore: prefer_typing_uninitialized_variables
  Map<String, String> map;

  final String categoryName;

  // ignore: prefer_typing_uninitialized_variables
  final String catergoryURL;

  String categoryId;

  final String mainCategoryId;

  void tapHandler(WidgetRef ref, String val, String catId) {
    print("Tapped tapped");
    print(categoryName);
    print(categoryId);

    // String mainCategoryId=map['mainCategoryId'];
    map = {'mainCategoryId': mainCategoryId, 'subCategoryId': catId};
    ref.read(categoryProvider(mainCategoryId).notifier).update((state) => map);
  }

  CategorySliderItems(
      {required this.map,
      required this.categoryName,
      required this.catergoryURL,
      required this.categoryId,
      required this.mainCategoryId});
  //  category=categoryName;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
        onTap: () {
          tapHandler(ref, categoryName, categoryId);
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(children: [
            Container(
              margin: const EdgeInsets.all(8),
              width: 50,
              height: 50,
              alignment: Alignment.center,
              child: Image.network(
                catergoryURL,
                height: 50,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  categoryName,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ]),
        ));
  }
}
