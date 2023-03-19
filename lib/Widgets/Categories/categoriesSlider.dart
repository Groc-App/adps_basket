// ignore_for_file: file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// late Map<String, String> map;
final categoryProvider = StateProvider.family<Map<String, String>, String>(
    (ref, String id) => {"mainCategoryId": id, "subCategoryId": "null"});

class CategorySliderItems extends ConsumerStatefulWidget {
  // const OfferScreen({Key? key}) : super(key: key);

  final Map<String, String> map;

  final String categoryName;

  final int index;

  // ignore: prefer_typing_uninitialized_variables
  final String catergoryURL;

  String categoryId;

  final String mainCategoryId;
  CategorySliderItems(
      {required this.map,
      required this.categoryName,
      required this.catergoryURL,
      required this.categoryId,
      required this.mainCategoryId,
      required this.index});

  @override
  _CategorySliderItemsState createState() => _CategorySliderItemsState(
        categoryId: categoryId,
        categoryName: categoryName,
        catergoryURL: catergoryURL,
        index: index,
        mainCategoryId: mainCategoryId,
        map: map,
      );
}

class _CategorySliderItemsState extends ConsumerState<CategorySliderItems> {
  // ignore: prefer_typing_uninitialized_variables
  late Map<String, String> map;

  late final String categoryName;

  late final int index;

  // ignore: prefer_typing_uninitialized_variables
  late final String catergoryURL;

  late String categoryId;

  late final String mainCategoryId;

  int selected = -1;
  @override
  void initState() {
    // TODO: implement initStat
    super.initState();
  }

  void tapHandler(WidgetRef ref, String val, String catId, int index) {
    // print("index::::::::::::::::::::::: $index");
    // print("Tapped tapped");
    // print(categoryName);
    // print(categoryId);

    // String mainCategoryId=map['mainCategoryId'];
    map = {'mainCategoryId': mainCategoryId, 'subCategoryId': catId};
    ref.read(categoryProvider(mainCategoryId).notifier).update((state) => map);
    setState(() {
      selected = index;
    });
  }

  _CategorySliderItemsState(
      {required this.map,
      required this.categoryName,
      required this.catergoryURL,
      required this.categoryId,
      required this.mainCategoryId,
      required this.index});
  //  category=categoryName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        tapHandler(ref, categoryName, categoryId, index);
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.all(8),
            width: 50,
            height: 60,
            alignment: Alignment.center,
            color: selected == index ? Colors.white : Colors.black,
            child: Image.network(
              catergoryURL,
              fit: BoxFit.cover,
              height: 60,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                categoryName,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
